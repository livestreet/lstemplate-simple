{if count($aTopics)>0}
	<div {if Config::Get('view.skin')=='simple' and ($sAction=='index' or !Config::Get('plugin.simpletpl.show_thumbs_only_index'))}style="margin-right:-21px"{/if}>
	{foreach from=$aTopics item=oTopic}
		{if Config::Get('view.skin')=='simple' and ($sAction=='index' or !Config::Get('plugin.simpletpl.show_thumbs_only_index'))}
		    {include file="topic_main.tpl" bTopicList=true}
        {else}
			{assign var="sTopicTemplateName" value="topic_`$oTopic->getType()`.tpl"}
			{include file=$sTopicTemplateName bTopicList=true}
		{/if}
	{/foreach}
    </div>

	{include file='paging.tpl' aPaging="$aPaging"}
{else}
	<div class="padding">&nbsp;&nbsp;{$aLang.blog_no_topic}</div>
{/if}