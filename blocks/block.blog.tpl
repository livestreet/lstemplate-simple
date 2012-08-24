{if $oTopic}
	{assign var="oBlog" value=$oTopic->getBlog()}
	{if $oBlog->getType()!='personal'}
		{assign var="oUserOwner" value=$oBlog->getOwner()}

		<div class="blockabout">
			<div class="first-info">
				<img src="{$oTopic->getBlog()->getAvatarPath(48)}" alt="avatar" class="avatar" title="{$oTopic->getBlog()->getTitle()|escape:'html'}" />
				<h2><a href="{$oBlog->getUrlFull()}">{$oTopic->getBlog()->getTitle()|escape:'html'}</a></h2>
			</div>
			<div class="second-info">{$oTopic->getBlog()->getDescription()}</div>
			<div class="third-info">
			{if $oTopic->getBlog()->getCountUser()}
				<b>{$oTopic->getBlog()->getCountUser()}</b> {$aLang.readers}
			{else}
				<b>{$aLang.none_readers}</b>
			{/if}
			</div>
			{if $oUserCurrent}
			<div class="fourth-info">
            	<div id="vote_area_blog_{$oBlog->getId()}" class="voting
            															{if $oBlog->getRating() > 0}
            																vote-count-positive
            															{elseif $oBlog->getRating() < 0}
            																vote-count-negative
            															{elseif $oBlog->getRating() == 0}
            																vote-count-zero
            															{/if}

            															{if $oVote}
            																voted

            																{if $oVote->getDirection() > 0}
            																	voted-up
            																{elseif $oVote->getDirection() < 0}
            																	voted-down
            																{/if}
            															{else}
            																not-voted
            															{/if}

            															{if ($oUserCurrent && $oUserOwner->getId() == $oUserCurrent->getId())}
            																vote-nobuttons
            															{/if}">
            		<a href="#" class="vote-item vote-up" onclick="return ls.vote.vote({$oBlog->getId()},this,1,'blog');"></a>
            		<div class="vote-item vote-count" title="{$aLang.blog_vote_count}: {$oBlog->getCountVote()}"><span id="vote_total_blog_{$oBlog->getId()}">{if $oBlog->getRating() > 0}+{/if}{$oBlog->getRating()}</span></div>
            		<a href="#" class="vote-item vote-down" onclick="return ls.vote.vote({$oBlog->getId()},this,-1,'blog');"></a>
            	</div>

				{if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId() and $oTopic->getBlog()->getType()!='personal'}
					<div onclick="ls.blog.toggleJoin(this,{$oBlog->getId()}); return false;" class="join {if $oBlog->getUserIsJoin()}active{/if}"></div>
				{/if}
			</div>
			{/if}

		</div>
	{/if}
{/if}