<?php
/*-------------------------------------------------------
*
*   LiveStreet Engine Social Networking
*   Copyright © 2008 Mzhelskiy Maxim
*
*--------------------------------------------------------
*
*   Official site: www.livestreet.ru
*   Contact e-mail: rus.engine@gmail.com
*
*   GNU General Public License, version 2:
*   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
*
---------------------------------------------------------
*/

class PluginSimpletpl_ModuleSimple extends Module {
	protected $oMapper;

	public function Init() {		
		$this->oMapper=Engine::GetMapper(__CLASS__);
	}


	/**
	 * Возвращает список топиков фото-сетов
	 *
	 * @param int $iCurrPage
	 * @param int $iPerPage
	 *
	 * @return array
	 */
	public function GetTopicsPhotoset($iCurrPage,$iPerPage) {
		return $this->oMapper->GetTopicsPhotoset($iCount,$iCurrPage,$iPerPage);
	}

	/**
	 * Загружает фото нового размера в фото-сет
	 *
	 * @param string $sFile
	 *
	 * @return bool
	 */
	public function UploadTopicPhoto($sFile) {
		$aPathInfo=pathinfo($sFile);

		$sFileName = $aPathInfo['filename'];
		$sPath = str_replace(Config::Get('path.root.server'),'',$aPathInfo['dirname'].'/');

		$aParams=$this->Image_BuildParams('photoset');
		$oImage = new LiveImage($sFile);
		/**
		 * Если объект изображения не создан,
		 * возвращаем ошибку
		 */
		if($sError=$oImage->get_last_error()) {
			// Вывод сообщения об ошибки, произошедшей при создании объекта изображения
			$this->Message_AddError($sError,$this->Lang_Get('error'));
			return false;
		}

		// Новые размеры
		$aSizes=Config::Get('plugin.simpletpl.size_images');


		foreach ($aSizes as $aSize) {
			// Для каждого указанного в конфиге размера генерируем картинку
			$sNewFileName = $sFileName.'_'.$aSize['w'];
			$oImage = new LiveImage($sFile);
			if ($aSize['crop']) {
				$this->Image_CropProportion($oImage, $aSize['w'], $aSize['h'], true);
				$sNewFileName .= 'crop';
			}
			$this->Image_Resize($sFile,$sPath,$sNewFileName,Config::Get('view.img_max_width'),Config::Get('view.img_max_height'),$aSize['w'],$aSize['h'],true,$aParams,$oImage);
		}

		return $this->Image_GetWebPath($sFile);
	}

	/**
	 * Анализирует текст топика на наличие источников превью
	 *
	 * @param $oTopic
	 */
	public function AnalysisTopic($oTopic) {
		/**
		 * Анализируем текст на наличие видео с youtube.com
		 * Проверям старый и новый код вставки
		 */
		if (!Config::Get('plugin.simpletpl.make_preview_video')) {
			return;
		}
		$sImage=null;
		if (preg_match('#<\s*param[^>]+value\s*=\s*"https?://(?:www\.|)youtube.com/v/([a-zA-Z0-9_\-]+)[^"]*"#i',$oTopic->getText(),$aMatch)) {
			$sImage="http://i3.ytimg.com/vi/{$aMatch[1]}/hqdefault.jpg";
		} elseif (preg_match('#<\s*iframe[^>]+src\s*=\s*"https?://(?:www\.|)youtube.com/embed/([a-zA-Z0-9_\-]+)[^"]*"#i',$oTopic->getText(),$aMatch)) {
			$sImage="http://i3.ytimg.com/vi/{$aMatch[1]}/hqdefault.jpg";
		}
		if (!is_null($sImage)) {
			// удаляем старую превьюшку на основе анализа текста топика
			if ($oTopic->getPreviewImage()) {
				$this->DeleteTopic($oTopic);
			}
			/**
			 * Загружаем превью
			 */
			if ($sImagePath=$this->UploadImageByUrl($oTopic,$sImage)) {
				$oTopic->setPreviewImage($sImagePath);
				$oTopic->setPreviewImageIsAuto(true);
			}
		}
	}

	/**
	 * Обработка загружки превью через форму (с компьютера)
	 *
	 * @param $oTopic
	 * @param $aFile
	 *
	 * @return string | bool
	 */
	public function UploadImageBySubmit($oTopic,$aFile) {
		if(!is_array($aFile) || !isset($aFile['tmp_name'])) {
			return false;
		}

		/**
		 * Сохраняем во временный файл
		 */
		$sFileTmp=Config::Get('sys.cache.dir').func_generator();
		if (!move_uploaded_file($aFile['tmp_name'],$sFileTmp)) {
			return false;
		}

		return $this->UploadImage($oTopic,$sFileTmp);
	}

	/**
	 * Обработка загрузки превью по внешнему URL (с интернета)
	 *
	 * @param $oTopic
	 * @param $sUrl
	 *
	 * @return string | bool
	 */
	public function UploadImageByUrl($oTopic,$sUrl) {
		/**
		 * Проверяем, является ли файл изображением
		 */
		if(!@getimagesize($sUrl)) {
			return false;
		}
		/**
		 * Открываем файловый поток и считываем файл поблочно,
		 * контролируя максимальный размер изображения
		 */
		$oFile=@fopen($sUrl,'r');
		if(!$oFile) {
			return false;
		}

		$iMaxSizeKb=200;
		$iSizeKb=0;
		$sContent='';
		while (!feof($oFile) and $iSizeKb<$iMaxSizeKb) {
			$sContent.=fread($oFile ,1024*1);
			$iSizeKb++;
		}

		/**
		 * Если конец файла не достигнут,
		 * значит файл имеет недопустимый размер
		 */
		if(!feof($oFile)) {
			return false;
		}
		fclose($oFile);

		/**
		 * Сохраняем во временный файл
		 */
		$sFileTmp=Config::Get('sys.cache.dir').func_generator();
		$fp=fopen($sFileTmp,'w');
		fwrite($fp,$sContent);
		fclose($fp);

		return $this->UploadImage($oTopic,$sFileTmp);
	}

	/**
	 * Обработка загрузки превью
	 *
	 * @param $oTopic
	 * @param $sFileTmp
	 *
	 * @return string | bool
	 */
	public function UploadImage($oTopic,$sFileTmp) {
		$oImage = new LiveImage($sFileTmp);
		$aParams=$this->Image_BuildParams('topic');
		/**
		 * Если объект изображения не создан,
		 * возвращаем ошибку
		 */
		if($sError=$oImage->get_last_error()) {
			@unlink($sFileTmp);
			return false;
		}

		/**
		 * Генерируем имя файла и каталога для превью
		 */
		$sFileName=func_generator();
		$sDirSave = Config::Get('path.uploads.root').'/topics/preview/'.preg_replace('~(.{2})~U', "\\1/", str_pad($oTopic->getId(), 8, "0", STR_PAD_LEFT));
		$sDirSave=rtrim($sDirSave,'/');

		if (!is_dir(Config::Get('path.root.server').$sDirSave)) {
			mkdir(Config::Get('path.root.server').$sDirSave, 0755, true);
		}

		// Добавляем к загруженному файлу расширение
		$sFile=Config::Get('path.root.server').$sDirSave.'/'.$sFileName.'.'.$oImage->get_image_params('format');
		rename($sFileTmp,$sFile);

		// Новые размеры
		$aSizes=Config::Get('plugin.simpletpl.size_images_review');

		$bError=false;
		foreach ($aSizes as $aSize) {
			// Для каждого указанного в конфиге размера генерируем картинку
			$sNewFileName = $sFileName.'_'.$aSize['w'];
			$oImage = new LiveImage($sFile);
			if ($aSize['crop']) {
				$this->Image_CropProportion($oImage, $aSize['w'], $aSize['h'], true);
				$sNewFileName .= 'crop';
			}

			if (!$this->Image_Resize($sFile,$sDirSave,$sNewFileName,Config::Get('view.img_max_width'),Config::Get('view.img_max_height'),$aSize['w'],$aSize['h'],true,$aParams,$oImage)) {
				$bError=true;
			}
		}
		if ($bError) {
			@unlink($sFile);
			return false;
		}
		return $this->Image_GetWebPath($sFile);
	}

	/**
	 * Удаление превью у топика
	 *
	 * @param $oTopic
	 */
	public function DeleteTopic($oTopic) {
		@unlink($this->Image_GetServerPath($oTopic->getPreviewImage()));
		$aSizes=Config::Get('plugin.simpletpl.size_images');
		// Удаляем все сгенерированные миниатюры основываясь на данных из конфига.
		foreach ($aSizes as $aSize) {
			$sSize = $aSize['w'];
			if ($aSize['crop']) {
				$sSize .= 'crop';
			}
			@unlink($this->Image_GetServerPath($oTopic->getPreviewImageWebPath($sSize)));
		}
		$oTopic->setPreviewImage(null);
		$oTopic->setPreviewImageIsAuto(false);
	}
}
?>