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
 * Обработка блока с лучшими топиками на главной странице
 *
 */
class PluginSimpletpl_BlockSimpleTopicsTop extends Block {
	public function Exec() {
		$sDate=date("Y-m-d H:00:00",time()-Config::Get('plugin.simpletpl.topic_time_top'));
		/**
		 * Получаем список топиков
		 */
		$aTopics=$this->Topic_GetTopicsRatingByDate($sDate,Config::Get('plugin.simpletpl.count_top_topics'));

		$this->Viewer_Assign('simpletpl_aTopicsTop',$aTopics);
		$this->Viewer_Assign('simpletpl_iCountSlide',ceil(count($aTopics)/2));
	}
}
?>