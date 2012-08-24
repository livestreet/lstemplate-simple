<div class="block1">
	<span>{hook run='copyright'}</span><br />
	<span>Y9 &mdash; <a href="http://y9.ru" target="_blank">разработка социальных сетей</a></span>
</div>
<div class="block4">
{if $oUserCurrent}
	<h3><a href="{$oUserCurrent->getUserWebPath()}">{$oUserCurrent->getLogin()}</a></h3>
	<a href="{router page='topic'}add/" class="js-write-window-show">{$aLang.make}</a><br />
	<a href="{router page='talk'}">{$aLang.user_privat_messages}</a><br />
	<a href="{router page='settings'}profile/">{$aLang.user_settings}</a><br />
	{if $oUserCurrent and $oUserCurrent->isAdministrator()}<a href="{cfg name='path.root.web'}/admin">{$aLang.admin_title}</a><br />{/if}
	<a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.quit}</a>
	{else}
	<h3>{$aLang.user_authorization}</h3>
	<a href="{router page='login'}" class="js-login-form-show sign-in">{$aLang.user_login_submit}</a><br />
	<a href="{router page='registration'}" class="js-registration-form-show">{$aLang.registration_submit}</a>
{/if}
</div>
<div class="block2">
	<h3>О сайте</h3>
	<a href="/">Контакты</a>
	<a href="/">Пользовательское соглашение</a>
</div>
<div class="block3">
	<h3>Подписка</h3>
	<a href="{router page='rss'}">RSS</a><br />
	<a href="/">Facebook</a><br />
	<a href="/">Twitter</a><br />
	<a href="/">Вконтакте</a>
</div>