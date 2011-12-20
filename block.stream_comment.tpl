<ul class="list">
	{foreach from=$aComments item=oComment name="cmt"}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}
		
		<li {if $smarty.foreach.cmt.iteration == 1}style="border-top:0px"{/if}>
            <a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(48)}" class="avatar" alt="avatar" /></a>
            <div class="information">
                <a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="stream-comment-icon">{$oTopic->getCountComment()}</a>

                <a href="{$oUser->getUserWebPath()}" class="user">{$oUser->getLogin()}</a><span class="date">{date_format date=$oComment->getDate() format="d.m.Y"}</span><br />
    			<a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="topic-title">{$oTopic->getTitle()|escape:'html'}</a>
            </div>
        </li>
	{/foreach}
</ul>

<div class="bottom">
	<a href="{router page='comments'}">{$aLang.block_stream_comments_all}</a>
</div>