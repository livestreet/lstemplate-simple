
<div class="comments" style="margin-left:0">
	{foreach from=$aComments item=oComment}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}

		<div class="comment">
            <div class="avatar"><a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" /></a></div>
            <div class="border-comment">
            	<div class="content">
                    <div class="arrow"></div>
                    <div class="padding">

                        <ul class="info">
                		    <li class="username"><a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
                		    <li class="date"><time datetime="{date_format date=$oComment->getDate() format='c'}">{date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</time></li>
                    	    <li><a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="reply-link">{$aLang.go_to_comment}</a></li>
                		</ul>

                        <div class="text-style">{$oComment->getText()}</div>
                    </div>
            	</div>
            </div>
        </div>
	{/foreach}
</div>

{include file='paging.tpl' aPaging="$aPaging"}