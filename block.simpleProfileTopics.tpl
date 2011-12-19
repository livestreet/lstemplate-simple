{if $simpletpl_aTopicsProfile and count($simpletpl_aTopicsProfile)}
<div class="user-profile-topics">
	<div class="user-profile-topics-inner">

		<div class="zagolovok">
			<h2>{$aLang.topics_h2}</h2>
			<a href="{router page='my'}{$oUserProfile->getLogin()}/">{$aLang.all_topics}</a>
		</div>

		{foreach from=$simpletpl_aTopicsProfile item=oTopic}
			{if $oTopic->getType()=='photoset'}
				{include file='topic_main_photoset.tpl' }
			{else}
				{include file='topic_main.tpl' }
			{/if}
		{/foreach}

	</div>
</div>
{/if}