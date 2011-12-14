{assign var="oUser" value=$oComment->getUser()}
{assign var="oVote" value=$oComment->getVote()}

<div id="comment_id_{$oComment->getId()}" class="comment {if !$oUserCurrent or ($oUserCurrent and !$oUserCurrent->isAdministrator())}not-admin{/if} {if $oComment->getDelete()} deleted{elseif $oUserCurrent and $oComment->getUserId()==$oUserCurrent->getId()} self{elseif $sDateReadLast<=$oComment->getDate()} new{/if}" >
{if !$oComment->getDelete() or $bOneComment or ($oUserCurrent and $oUserCurrent->isAdministrator())}
	<a name="comment{$oComment->getId()}" ></a>


	<div class="folding"></div>

    <div class="avatar"><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" title="{$oUser->getLogin()}" /></a></div>

    <div class="border-comment">
    	<div id="comment_content_id_{$oComment->getId()}" class="content">
            <div class="arrow"></div>
            <div class="padding">

                <ul class="info">
        		    <li class="username"><a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
        		    <li class="date">{date_format date=$oComment->getDate()}</li>
            	    <li><a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}#comment{/if}{$oComment->getId()}" class="comment-link" title="{$aLang.link_to_comment}"></a></li>
        		    {if $oUserCurrent and !$oComment->getDelete() and !$bAllowNewComment}
            			<li><a href="#" onclick="ls.comments.toggleCommentForm({$oComment->getId()}); return false;" class="reply-link">{$aLang.comment_answer}</a></li>
            		{/if}
                    {if $oComment->getTargetType()!='talk'}
              		<li id="vote_area_comment_{$oComment->getId()}" class="voting {if $oComment->getRating()>0}positive{elseif $oComment->getRating()<0}negative{/if} {if !$oUserCurrent || $oComment->getUserId()==$oUserCurrent->getId() ||  strtotime($oComment->getDate())<$smarty.now-$oConfig->GetValue('acl.vote.comment.limit_time')}guest{/if}   {if $oVote} voted {if $oVote->getDirection()>0}plus{else}minus{/if}{/if}  ">
                        <a href="#" class="minus" onclick="return ls.vote.vote({$oComment->getId()},this,-1,'comment');" title="Не согласен"></a>
              			<span id="vote_total_comment_{$oComment->getId()}" class="total">{if $oComment->getRating()>0}+{/if}{$oComment->getRating()}</span>
              			<a href="#" class="plus" onclick="return ls.vote.vote({$oComment->getId()},this,1,'comment');" title="Согласен"></a>
              		</li>
              	    {/if}
        		</ul>

        		{if $oComment->isBad()}
        			<div style="display: none;" id="comment_text_{$oComment->getId()}">
        				{$oComment->getText()}
        			</div>
        			 <a href="#" onclick="jQuery('#comment_text_{$oComment->getId()}').show();jQuery(this).hide();return false;">{$aLang.comment_bad_open}</a>
        		{else}
        			<div class="text-style">{$oComment->getText()}</div>
        		{/if}
            </div>
    	</div>

    </div>
{else}
	{$aLang.comment_was_delete}
{/if}
{if $oUserCurrent}
	<div class="comment-preview" id="comment_preview_{$oComment->getId()}" style="display: none;"></div>
	<div class="reply" id="reply_{$oComment->getId()}" style="display: none;"></div>
{/if}
</div>