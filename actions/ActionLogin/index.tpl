{assign var="noSidebar" value=true}
{include file='header.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#login-form').bind('submit',function(){
			ls.user.login('login-form');
			return false;
		});
		$('#login-form-submit').attr('disabled',false);
	});
</script>

<div class="content-error">
<h2 class="page-header">{$aLang.user_authorization}</h2>

{hook run='login_begin'}

<form action="{router page='login'}" method="POST" id="login-form">
	{hook run='form_login_begin'}

	<p><label for="login">{$aLang.user_login}</label>
	<input type="text" id="login" name="login" class="input-text input-width-200" /></p>
	
	<p><label for="password">{$aLang.user_password}</label>
	<input type="password" id="password" name="password" class="input-text input-width-200" />
	<small class="validate-error-hide validate-error-login"></small></p>
	
	<p><label><input type="checkbox" name="remember" checked class="input-checkbox" /> {$aLang.user_login_remember}</label></p>
	
	{hook run='form_login_end'}

     <button type="submit" class="button2" name="submit_login" id="login-form-submit" disabled="disabled">
            <div class="l"></div>
            <div class="r"></div>{$aLang.user_login_submit}</button>
     
	<a href="{router page='registration'}">{$aLang.user_registration}</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="{router page='login'}reminder/">{$aLang.user_password_reminder}</a>
</form>


{if $oConfig->GetValue('general.reg.invite')}
	<br /><br />
	<form action="{router page='registration'}invite/" method="POST">
		<h2>{$aLang.registration_invite}</h2>

		<p><label>{$aLang.registration_invite_code}<br />
		<input type="text" name="invite_code" /></label></p>

        <button type="submit" class="button2" name="submit_invite" id="login-form-submit">
            <div class="l"></div>
            <div class="r"></div>{$aLang.registration_invite_check}</button>

	</form>
{/if}

{hook run='login_end'}
</div>

{include file='footer.tpl'}