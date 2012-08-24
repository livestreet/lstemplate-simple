{assign var="oUser" value=$oComment->getUser()}
{assign var="oVote" value=$oComment->getVote()}


<section id="comment_id_{$oComment->getId()}" class="comment {if !$oUserCurrent or ($oUserCurrent and !$oUserCurrent->isAdministrator())}not-admin{/if} {if $oComment->getDelete()} deleted{elseif $oUserCurrent and $oComment->getUserId()==$oUserCurrent->getId()} self{elseif $sDateReadLast<=$oComment->getDate()} new{/if}">
	{if !$oComment->getDelete() or $bOneComment or ($oUserCurrent and $oUserCurrent->isAdministrator())}
		<a name="comment{$oComment->getId()}"></a>
		
		<div class="folding"></div>

        <div class="avatar"><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" title="{$oUser->getLogin()}" /></a></div>

        <div class="border-comment">
        	<div id="comment_content_id_{$oComment->getId()}" class="content">
                <div class="arrow"></div>
                <div class="padding">

                    <ul class="info">
            		    <li class="username"><a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
            		    <li class="date">
            				<time datetime="{date_format date=$oComment->getDate() format='c'}" title="{date_format date=$oComment->getDate() format="j F Y, H:i"}">
            					{date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
            				</time>
                        </li>
                	    <li><a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}#comment{/if}{$oComment->getId()}" class="comment-link" title="{$aLang.link_to_comment}"></a></li>
                        {if $oUserCurrent}
            				{if !$oComment->getDelete() and !$bAllowNewComment}
            					<li><a href="#" onclick="ls.comments.toggleCommentForm({$oComment->getId()}); return false;" class="reply-link">{$aLang.comment_answer}</a></li>
            				{/if}
            			{/if}
            			{if $oUserCurrent and !$bNoCommentFavourites}
            				<li class="comment-favourite">
            					<div onclick="return ls.favourite.toggle({$oComment->getId()},this,'comment');" class="favourite {if $oComment->getIsFavourite()}active{/if}"></div>
            					<span class="favourite-count" id="fav_count_comment_{$oComment->getId()}">{if $oComment->getCountFavourite() > 0}{$oComment->getCountFavourite()}{/if}</span>
            				</li>
            			{/if}
            			{if $oUserCurrent}
            				{if !$oComment->getDelete() and $oUserCurrent and $oUserCurrent->isAdministrator()}
            					<li><a href="#" class="comment-delete reply-link" onclick="ls.comments.toggle(this,{$oComment->getId()}); return false;">{$aLang.comment_delete}</a></li>
            				{/if}

            				{if $oComment->getDelete() and $oUserCurrent and $oUserCurrent->isAdministrator()}
            					<li><a href="#" class="comment-repair reply-link" onclick="ls.comments.toggle(this,{$oComment->getId()}); return false;">{$aLang.comment_repair}</a></li>
            				{/if}

            				{hook run='comment_action' comment=$oComment}
            			{/if}

    		            {if $oComment->getTargetType()!='talk'}
        				<li id="vote_area_comment_{$oComment->getId()}" class="voting
        																		{if $oComment->getRating() > 0}
        																			vote-count-positive
        																		{elseif $oComment->getRating() < 0}
        																			vote-count-negative
        																		{/if}

        																		{if (strtotime($oComment->getDate()) < $smarty.now - $oConfig->GetValue('acl.vote.comment.limit_time') && !$oVote) || ($oUserCurrent && $oUserCurrent->getId() == $oUser->getId())}
        																			vote-expired
        																		{/if}

        																		{if $oVote}
        																			voted

        																			{if $oVote->getDirection() > 0}
        																				voted-up
        																			{else}
        																				voted-down
        																			{/if}
        																		{/if}">

        					<div class="vote-up" onclick="return ls.vote.vote({$oComment->getId()},this,1,'comment');"></div>
        					<span class="vote-count" id="vote_total_comment_{$oComment->getId()}">{if $oComment->getRating() > 0}+{/if}{$oComment->getRating()}</span>
                            <div class="vote-down" onclick="return ls.vote.vote({$oComment->getId()},this,-1,'comment');"></div>
        				</li>
                  	    {/if}

                        {hook run='comment_action' comment=$oComment}
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
</section>