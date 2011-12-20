<p>
	{if $oTopicEdit and $oTopicEdit->getPreviewImage()}
		<img src="{$oTopicEdit->getPreviewImageWebPath('229crop')}" />
		<input type="checkbox" id="topic_preview_image_delete" name="topic_preview_image_delete" value="on">
		<label for="topic_preview_image_delete"> &mdash; {$aLang.simpletpl_form_preview_image_delete} {if $oTopicEdit->getPreviewImageIsAuto()}({$aLang.simpletpl_form_preview_image_delete_auto}){/if}</label><br />
	{/if}
	<label for="topic_preview_image">{$aLang.simpletpl_form_preview_image}:</label><br />
	<input class="input-200" type="file" name="topic_preview_image" id="topic_preview_image"><br />
	<span class="note">{$aLang.simpletpl_form_preview_image_notice}</span>
</p>