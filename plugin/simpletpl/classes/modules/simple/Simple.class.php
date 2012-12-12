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

	public function InitConfigMainPreview() {
		Config::Set('plugin.mainpreview.size_images_preview',array_merge(Config::Get('plugin.mainpreview.size_images_preview'),Config::Get('plugin.simpletpl.size_images_preview')));

		Config::Set('plugin.mainpreview.preview_minimal_size_width',Config::Get('plugin.simpletpl.preview_size_w'));
		Config::Set('plugin.mainpreview.preview_minimal_size_height',Config::Get('plugin.simpletpl.preview_size_h'));
	}
}
?>