{if $simpletpl_aCommentsProfile and count($simpletpl_aCommentsProfile)}
<div class="user-profile-comments">

	<div class="zagolovok">
		<h2>{$aLang.comments_h2}</h2>
		<a href="{router page='my'}{$oUserProfile->getLogin()}/comment/">{$aLang.all_comments}</a>
	</div>

	{foreach from=$simpletpl_aCommentsProfile item=oComment}
		{assign var="oUser" value=$oComment->getUser()}
		<div class="comment">
			<div class="avatar"><a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" /></a></div>
			<div class="border-comment">
				<div class="content">
					<div class="arrow"></div>
					<div class="padding">
						<div class="text-style">{$oComment->getText()}</div>
					</div>
				</div>
			</div>
		</div>
	{/foreach}

</div>
{/if}