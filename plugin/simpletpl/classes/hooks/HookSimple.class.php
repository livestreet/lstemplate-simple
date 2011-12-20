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

		$this->AddHook('template_form_add_topic_topic_end', 'AddTopicPreviewForm', __CLASS__);
		$this->AddHook('template_form_add_topic_link_end', 'AddTopicPreviewForm', __CLASS__);
		$this->AddHook('template_form_add_topic_question_end', 'AddTopicPreviewForm', __CLASS__);

		$this->AddHook('topic_add_after','SaveTopic');
		$this->AddHook('topic_edit_after','SaveTopic');
		$this->AddHook('topic_edit_show', 'TopicEdit', __CLASS__);
	}

	public function SaveTopic($aParams) {
		$oTopic=$aParams['oTopic'];
		/**
		 * Получаем топик, чтоб подцепить связанные данные
		 */
		$oTopic=$this->Topic_GetTopicById($oTopic->getId());
		$aParams['oTopic']=$oTopic;

		/**
		 * По умолчанию анализируем текст топика топик
		 */
		$bAnalysisTopic=true;
		/**
		 * Удаление превью
		 */
		if (isset($_REQUEST['topic_preview_image_delete'])) {
			if ($oTopic->getPreviewImageIsAuto()) {
				// После удаление не нужно создавать автоматически новое превью
				$bAnalysisTopic=false;
			}
			$this->PluginSimpletpl_Simple_DeleteTopic($oTopic);
		}

		/**
		 * Загрузка пользовательского превью
		 */
		if (isset($_FILES['topic_preview_image']) and is_uploaded_file($_FILES['topic_preview_image']['tmp_name'])) {
			$bAnalysisTopic=false;
			$this->PluginSimpletpl_Simple_DeleteTopic($oTopic);
			if ($sImagePath=$this->PluginSimpletpl_Simple_UploadImageBySubmit($oTopic,$_FILES['topic_preview_image'])) {
				$oTopic->setPreviewImage($sImagePath);
				$oTopic->setPreviewImageIsAuto(false);
			}
		}
		if ($bAnalysisTopic) {
			/**
			 * Анализируем текст только если нет превью, либо оно автоматическое
			 */
			if (!$oTopic->getPreviewImage() or $oTopic->getPreviewImageIsAuto()) {
				$this->PluginSimpletpl_Simple_AnalysisTopic($oTopic);
			}
		}

		// из-за бага в двике необходимо изменить поле в основной таблице топика, чтобы произошел апдейт таблицы контента
		$oTopic->setTextHash(md5($oTopic->getTextSource().'extra'.$oTopic->getExtra()));
		// Сохраняем данные
		$this->Topic_UpdateTopic($oTopic);
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

	public function AddTopicPreviewForm() {
		return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'inject.topic.form.tpl');
	}

	public function TopicEdit($aVars) {
		$oTopic=$aVars['oTopic'];
		$this->Viewer_Assign('oTopicEdit',$oTopic);
	}
}
?>