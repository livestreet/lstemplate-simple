{assign var="oUser" value=$oTopic->getUser()}

<h3 class="profile-page-header">{$aLang.topic_preview}</h3>

<article class="topic topic-type-{$oTopic->getType()}">
    <header class="topic-header">
        <div class="date">
    	    <time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
    	        {date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
    	    </time>
        </div>

    	<h3 class="topic-title">
    	    {$oTopic->getTitle()|escape:'html'}
    	</h3>

    	<ul class="info-top">
    		<li class="writer">{$aLang.author_topic}: <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
    	</ul>
    </header>

	<div class="topic-content text">
		{hook run='topic_preview_content_begin' topic=$oTopic}

		{$oTopic->getText()}

		{hook run='topic_preview_content_end' topic=$oTopic}
	</div>

	<footer class="topic-footer">
		<ul class="topic-tags">
			<li>{$aLang.block_tags}:</li>
			{strip}
				{if $oTopic->getTagsArray()}
					{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
						<li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
					{/foreach}
				{else}
					<li>{$aLang.topic_tags_empty}</li>
				{/if}
			{/strip}
		</ul>

		<ul class="topic-info" style="background:none; height:auto">
			{hook run='topic_preview_show_info' topic=$oTopic}
		</ul>

		{hook run='topic_preview_show_end' topic=$oTopic}
	</footer>
</article>
     <div class="button2 button-primary">
        <em></em><span></span><button type="submit"  name="submit_topic_publish" id="submit_topic_publish">{$aLang.topic_create_submit_publish}</button>
     </div>
     <div class="button2 button-primary l-b">
        <em></em><span></span><button type="submit"  name="submit_preview" onclick="jQuery('#text_preview').html('').hide(); return false;">{$aLang.topic_create_submit_preview_close}</button>
     </div>
     <div class="button2 button-primary l-b">
        <em></em><span></span><button type="submit"  name="submit_topic_save" id="submit_topic_save">{$aLang.topic_create_submit_save}</button>
     </div>