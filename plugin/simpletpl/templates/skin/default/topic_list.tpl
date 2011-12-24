{if count($aTopics)>0}
	{foreach from=$aTopics item=oTopic}
		{if $sAction=='index' or !Config::Get('plugin.simpletpl.show_thumbs_only_index')}
			{include file="topic_main.tpl" bTopicList=true}
		{else}
			{assign var="sTopicTemplateName" value="topic_`$oTopic->getType()`.tpl"}
			{include file=$sTopicTemplateName bTopicList=true}
		{/if}
	{/foreach}

	{include file='paging.tpl' aPaging="$aPaging"}
{else}
	<div class="padding">&nbsp;&nbsp;{$aLang.blog_no_topic}</div>
{/if}