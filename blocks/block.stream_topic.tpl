
<ul class="latest-list">
	{foreach from=$oTopics item=oTopic name="cmt"}
		{assign var="oUser" value=$oTopic->getUser()}
		{assign var="oBlog" value=$oTopic->getBlog()}

        <li class="js-title-topic" title="{$oTopic->getText()|strip_tags|trim|truncate:150:'...'|escape:'html'}" {if $smarty.foreach.cmt.iteration == 1}style="border-top:0px"{/if}>
            <a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(48)}" class="avatar" alt="avatar" /></a>
            <div class="information">
                <a href="{$oTopic->getUrl()}#comment" class="stream-comment-icon">{$oTopic->getCountComment()}</a>

                <a href="{$oUser->getUserWebPath()}" class="user2">{$oUser->getLogin()}</a><span class="date">
				<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format="j F Y, H:i"}">
					{date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j.m.Y"}
				</time></span><br />
    			<a href="{$oTopic->getUrl()}" class="topic-title">{$oTopic->getTitle()|escape:'html'}</a>
            </div>
        </li>
	{/foreach}
</ul>

<footer>
	<a href="{router page='index'}new/">{$aLang.block_stream_topics_all}</a>
</footer>