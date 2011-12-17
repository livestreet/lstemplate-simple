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
 * Обработка блока с архивом
 *
 */
class PluginSimpletpl_BlockSimpleProfileComments extends Block {
	public function Exec() {
		if ($oUser=$this->GetParam('user')) {
			$aResult=$this->Comment_GetCommentsByUserId($oUser->getId(),'topic',1,Config::Get('plugin.simpletpl.count_profile_comments'));

			$this->Viewer_Assign('simpletpl_aCommentsProfile',$aResult['collection']);
		}
	}
}
?>