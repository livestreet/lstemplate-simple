<div class="navigation" >
	<h2>
			{if $aParams[0]=='whois' or $aParams[0]==''}
				{$aLang.user_menu_profile_whois}
			{elseif $aParams[0]=='favourites' and $aParams[1]==''}
				{$aLang.user_menu_profile_favourites}
			{elseif $aParams[1]=='comments'}
				{$aLang.user_menu_profile_favourites_comments}
			{/if}
	</h2>

	<ul>

		<li {if $aParams[0]=='whois' or $aParams[0]==''}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}">{$aLang.user_menu_profile_whois}</a></li>
		<li {if $aParams[0]=='favourites' and $aParams[1]==''}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}favourites/">{$aLang.user_menu_profile_favourites}</a>{if $iCountTopicFavourite} ({$iCountTopicFavourite}){/if}</li>
		<li {if $aParams[1]=='comments'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}favourites/comments/">{$aLang.user_menu_profile_favourites_comments}</a>{if $iCountCommentFavourite} ({$iCountCommentFavourite}){/if}</li>


	{hook run='menu_profile'}
	</ul>
</div>