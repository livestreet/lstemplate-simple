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


class PluginSimpletpl_ActionSimple extends ActionPlugin {
	/**
	 * Инициализация 
	 *
	 * @return null
	 */
	public function Init() {
		/**
		 * Если пользователь не авторизован и не админ, то выкидываем его
		 */
		$this->oUserCurrent=$this->User_GetUserCurrent();
		if (!$this->oUserCurrent or !$this->oUserCurrent->isAdministrator()) {
			return $this->EventNotFound();
		}
	}
	
	protected function RegisterEvent() {
		$this->AddEvent('convert','EventConvert');
	}
		
	
	/**********************************************************************************
	 ************************ РЕАЛИЗАЦИЯ ЭКШЕНА ***************************************
	 **********************************************************************************
	 */
	
	/**
	 * Конвертация фото-сетов к нужным размерам шаблона
	 */
	protected function EventConvert() {

		if (isPost('submit_convert')) {
			$this->Security_ValidateSendForm();

			$iPage=1;
			$iCount=0;
			$iCountPhoto=0;
			while ($aTopics=$this->PluginSimpletpl_Simple_GetTopicsPhotoset($iPage,20)) {
				$iPage++;
				foreach($aTopics as $oTopic) {
					if ($aPhotos=$oTopic->getPhotosetPhotos()) {
						foreach($aPhotos as $oPhoto) {
							$sServerPath=$this->Image_GetServerPath($oPhoto->getWebPath('229crop'));
							if (!file_exists($sServerPath)) {
								$sFile=$this->Image_GetServerPath($oPhoto->getPath());
								$this->PluginSimpletpl_Simple_UploadTopicPhoto($sFile);
								$iCountPhoto++;
							}
						}
						$iCount++;
					}
				}
			}

			$this->Message_AddNotice($this->Lang_Get('simpletpl_convert_end',array('count_topic'=>$iCount,'count_photo'=>$iCountPhoto)));
		}


	}

}
?>