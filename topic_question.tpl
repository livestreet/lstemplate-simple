{include file='topic_part_header.tpl'}


<div id="topic_question_area_{$oTopic->getId()}" class="poll">
	{if !$oTopic->getUserQuestionIsVote()}
		<ul class="poll-vote">
			{foreach from=$oTopic->getQuestionAnswers() key=key item=aAnswer}
				<li><label><input type="radio" id="topic_answer_{$oTopic->getId()}_{$key}" name="topic_answer_{$oTopic->getId()}" value="{$key}" onchange="jQuery('#topic_answer_{$oTopic->getId()}_value').val(jQuery(this).val());" /> {$aAnswer.text|escape:'html'}</label></li>
			{/foreach}
		</ul>

        <div class="button2 l-b" style="float:left"><em></em><span></span><button type="submit"  onclick="ls.poll.vote({$oTopic->getId()},jQuery('#topic_answer_{$oTopic->getId()}_value').val());">{$aLang.topic_question_vote}</button></div>
        <div class="button2 l-b"><em></em><span></span><button type="submit"  onclick="ls.poll.vote({$oTopic->getId()},-1)">{$aLang.topic_question_abstain}</button></div>
         
		<input type="hidden" id="topic_answer_{$oTopic->getId()}_value" value="-1" />
	{else}
		{include file='question_result.tpl'}
	{/if}
</div>


<div class="topic-content text">
	{hook run='topic_content_begin' topic=$oTopic bTopicList=$bTopicList}
	
	{$oTopic->getText()}
	
	{hook run='topic_content_end' topic=$oTopic bTopicList=$bTopicList}
</div> 



{include file='topic_part_footer.tpl'}