
<ul class="latest-list">
	{foreach from=$aComments item=oComment name="cmt"}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}

		<li class="js-title-comment" title="{$oComment->getText()|strip_tags|trim|truncate:100:'...'|escape:'html'}" {if $smarty.foreach.cmt.iteration == 1}style="border-top:0px"{/if}>
            <a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(48)}" class="avatar" alt="avatar" /></a>
            <div class="information">
                <a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="stream-comment-icon">{$oTopic->getCountComment()}</a>

                <a href="{$oUser->getUserWebPath()}" class="user2">{$oUser->getLogin()}</a><span class="date">
				<time datetime="{date_format date=$oComment->getDate() format='c'}" title="{date_format date=$oComment->getDate() format="j F Y, H:i"}">
					{date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j.m.Y"}
				</time>
                </span><br />
    			<a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="topic-title">{$oTopic->getTitle()|escape:'html'}</a>
            </div>
        </li>
	{/foreach}
</ul>

<footer>
	<a href="{router page='comments'}">{$aLang.block_stream_comments_all}</a>
</footer>