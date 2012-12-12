{if count($aTopics)>0}
	{add_block group='toolbar' name='toolbar_topic.tpl' iCountTopic=count($aTopics)}

    {if ($sAction=='index' and $sEvent=='') or !Config::Get('plugin.simpletpl.show_thumbs_only_index')}
        <ul class="topics-short">
            {foreach from=$aTopics item=oTopic}
        		{if $LS->Topic_IsAllowTopicType($oTopic->getType())}
        			{assign var="sTopicTemplateName" value="topic_`$oTopic->getType()`.tpl"}
            	    {include file="topic_main.tpl"}
        		{/if}
        	{/foreach}
        </ul>
    {else}

	{foreach from=$aTopics item=oTopic}
		{if $LS->Topic_IsAllowTopicType($oTopic->getType())}
			{assign var="sTopicTemplateName" value="topic_`$oTopic->getType()`.tpl"}
    	    {include file=$sTopicTemplateName bTopicList=true}
		{/if}
	{/foreach}
    {/if}
    
	{include file='paging.tpl' aPaging=$aPaging}
{else}
	{$aLang.blog_no_topic}
{/if}