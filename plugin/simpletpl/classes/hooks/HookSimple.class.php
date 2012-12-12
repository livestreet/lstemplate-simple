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
        $this->AddHook('template_admin_action_item','InjectAdmin');
	}

	/**
	 * Прогружаем на все страницы число новых топиков
	 */
	public function InitAction() {
		$this->PluginSimpletpl_Simple_InitConfigMainPreview();
		$this->Viewer_Assign('iCountTopicsNew',$this->Topic_GetCountTopicsCollectiveNew()+$this->Topic_GetCountTopicsPersonalNew());
	}

	/**
	 * Добавляем в стандартную админку ссылку на конвертер фото-сетов
	 */
	public function InjectAdmin() {
		return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'inject.admin.menu.tpl');
	}
}
?>