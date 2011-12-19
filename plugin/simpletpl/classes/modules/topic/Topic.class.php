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
 * Добавляем в функционал в модуль "Topic"
 *
 */
class PluginSimpletpl_ModuleTopic extends PluginSimpletpl_Inherit_ModuleTopic {

	/**
	 * Дополнительная обработка удаления топика
	 *
	 * @param unknown_type $oTopicId
	 * @return unknown
	 */
	public function DeleteTopic($oTopicId) {
		if ($oTopicId instanceof ModuleTopic_EntityTopic) {
			$oTopic=$oTopicId;
		} else {
			$oTopic=$this->GetTopicById($oTopicId);
		}

		if ($oTopic) {
			$this->PluginSimpletpl_Simple_DeleteTopic($oTopic);
		}

		return parent::DeleteTopic($oTopicId);
	}

}
?>