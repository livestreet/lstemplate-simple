<div class="user-profile">
	{hook run='profile_top_begin' oUserProfile=$oUserProfile}
    
	<div class="vote-profile">
		<div id="vote_area_user_{$oUserProfile->getId()}" class="voting
																	{if $oUserProfile->getRating() > 0}
																		vote-count-positive
																	{elseif $oUserProfile->getRating() < 0}
																		vote-count-negative
																	{elseif $oUserProfile->getRating() == 0}
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

																	{if ($oUserCurrent && $oUserProfile->getId() == $oUserCurrent->getId()) || !$oUserCurrent}
																		vote-nobuttons
																	{/if}">
		    <div class="text">{$aLang.user_rating}</div>
			{if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}<div class="vote-item vote-up" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"></div>{/if}
			<div class="vote-item vote-count" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}">
				<span id="vote_total_user_{$oUserProfile->getId()}">{if $oUserProfile->getRating() > 0}+{/if}{$oUserProfile->getRating()}</span>
			</div>
			{if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}<div class="vote-item vote-down" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"></div>{/if}
		</div>
	</div>

	<div class="strength">
		<div class="text">{$aLang.user_skill}</div>
		<div class="count" id="user_skill_{$oUserProfile->getId()}">{$oUserProfile->getSkill()}</div>
	</div>

	<img src="{$oUserProfile->getProfileAvatarPath(48)}" alt="avatar" class="avatar" />
	<h2>{$oUserProfile->getLogin()}</h2>
	{if $oSession}
    	<p class="last">{$aLang.last_visit}:&nbsp;&nbsp;<span>{date_format date=$oSession->getDateLast()}</span></p>
	{/if}

	{hook run='profile_top_end' oUserProfile=$oUserProfile}
</div>