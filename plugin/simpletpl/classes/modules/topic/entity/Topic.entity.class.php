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


/**
 * Добавление новых полей в топик
 * Поля хранятся в специальном поле extra в виде сериализованного массива
 */
class PluginSimpletpl_ModuleTopic_EntityTopic extends PluginSimpletpl_Inherit_ModuleTopic_EntityTopic {

	public function getPreviewImage() {
		return $this->getExtraValue('preview_image');
	}

	public function getPreviewImageIsAuto() {
		return $this->getExtraValue('preview_image_is_auto');
	}

	public function setPreviewImage($data) {
		$this->setExtraValue('preview_image',$data);
	}

	public function setPreviewImageIsAuto($data) {
		$this->setExtraValue('preview_image_is_auto',$data);
	}

	public function getPreviewImageWebPath($sWidth = null)
	{
		if ($this->getPreviewImage()) {
			if ($sWidth) {
				$aPathInfo=pathinfo($this->getPreviewImage());
				return $aPathInfo['dirname'].'/'.$aPathInfo['filename'].'_'.$sWidth.'.'.$aPathInfo['extension'];
			} else {
				return $this->getPreviewImage();
			}
		} else {
			return null;
		}
	}

}
?>