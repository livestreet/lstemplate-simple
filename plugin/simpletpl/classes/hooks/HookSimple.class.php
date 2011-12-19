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

class PluginSimpletpl_HookSimple extends Hook {

    public function RegisterHook() {
		$this->AddHook('init_action', 'InitAction');
        $this->AddHook('topic_show','TopicShow');
        $this->AddHook('template_admin_action_item','InjectAdmin');
    }

	public function InitAction() {
		$this->Viewer_Assign('iCountTopicsNew',$this->Topic_GetCountTopicsCollectiveNew()+$this->Topic_GetCountTopicsPersonalNew());
	}

	public function InjectAdmin() {
		return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'inject.admin.menu.tpl');
	}
    
    public function TopicShow($aParams) {
    	$oTopic=$aParams['oTopic'];
    	$oTopic->setCountRead($oTopic->getCountRead()+1);
    	$this->Topic_UpdateTopic($oTopic);
    }
}
?>