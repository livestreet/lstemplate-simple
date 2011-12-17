{if $simpletpl_aUsersTop and count($simpletpl_aUsersTop)}
<div class="top-authors">
	<ul>
		<li class="title">
		{$aLang.best_authors}<br />
			<span>{$aLang.by_rating}</span>
		</li>
		{foreach from=$simpletpl_aUsersTop item=oUser}
			<li><a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(24)}" /></a></li>
		{/foreach}
	</ul>
</div>
{/if}