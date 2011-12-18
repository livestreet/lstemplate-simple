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
		$aSizes=array(
			array(
				'w' => 229,
				'h' => 116,
				'crop' => true,
			),
			array(
				'w' => 354,
				'h' => 186,
				'crop' => true,
			)
		);


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
}
?>