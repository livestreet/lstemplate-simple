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

class PluginSimpletpl_ModuleSimple_MapperSimple extends Mapper {

	public function GetTopicsPhotoset(&$iCount,$iCurrPage,$iPerPage) {
		$sql = "
							SELECT
								*
							FROM
								".Config::Get('db.table.topic')."
							WHERE
								topic_type = 'photoset'
							ORDER BY topic_id ASC
                            LIMIT ?d, ?d ";

		$aTopics=array();
		if ($aRows=$this->oDb->selectPage($iCount,$sql,($iCurrPage-1)*$iPerPage, $iPerPage)) {
			foreach ($aRows as $aTopic) {
				$aTopics[]=Engine::GetEntity('Topic',$aTopic);
			}
		}
		return $aTopics;
	}
}
?>