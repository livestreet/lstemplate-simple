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


	public function GetTopicsPhotoset($iCurrPage,$iPerPage) {
		return $this->oMapper->GetTopicsPhotoset($iCount,$iCurrPage,$iPerPage);
	}


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


	public function AnalysisTopic($oTopic) {
		/**
		 * Анализируем текст на наличие видео с youtube.com
		 * Проверям старый и новый код вставки
		 */
		$sImage=null;
		if (preg_match('#<\s*param[^>]+value\s*=\s*"https?://(?:www\.|)youtube.com/v/([a-zA-Z0-9_\-]+)[^"]*"#i',$oTopic->getText(),$aMatch)) {
			$sImage="http://i3.ytimg.com/vi/{$aMatch[1]}/hqdefault.jpg";
		} elseif (preg_match('#<\s*iframe[^>]+src\s*=\s*"https?://(?:www\.|)youtube.com/embed/([a-zA-Z0-9_\-]+)[^"]*"#i',$oTopic->getText(),$aMatch)) {
			$sImage="http://i3.ytimg.com/vi/{$aMatch[1]}/hqdefault.jpg";
		}
		if (!is_null($sImage)) {
			if ($sImagePath=$this->UploadVideoImage($oTopic,$sImage)) {
				$oTopic->setPreviewImage($sImagePath);
			}
		}
	}

	public function UploadVideoImage($oTopic,$sUrl) {
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

		$sDirSave=$this->Image_GetIdDir($oTopic->getUserId());
		$aParams=$this->Image_BuildParams('topic');

		if (!is_dir(Config::Get('path.root.server').$sDirSave)) {
			mkdir(Config::Get('path.root.server').$sDirSave, 0755, true);
		}

		$sFileName=func_generator();
		$sFileTmp=Config::Get('path.root.server').$sDirSave.'/'.$sFileName;
		$fp=fopen($sFileTmp,'w');
		fwrite($fp,$sContent);
		fclose($fp);

		$oImage = new LiveImage($sFileTmp);
		/**
		 * Если объект изображения не создан,
		 * возвращаем ошибку
		 */
		if($sError=$oImage->get_last_error()) {
			@unlink($sFileTmp);
			return false;
		}

		// Добавляем к загруженному файлу расширение
		$sFile=$sFileTmp.'.'.$oImage->get_image_params('format');
		rename($sFileTmp,$sFile);

		// Новые размеры
		$aSizes=Config::Get('plugin.simpletpl.size_images');

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
				var_dump("error");
				$bError=true;
			}
		}
		if ($bError) {
			@unlink($sFile);
			return false;
		}
		return $this->Image_GetWebPath($sFile);
	}


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
	}
}
?>