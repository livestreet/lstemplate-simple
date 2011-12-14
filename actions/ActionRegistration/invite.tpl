{assign var="noSidebar" value=true}
{include file='header.light.tpl'}


<div class="inside">
<div class="center">
	<form action="{router page='registration'}invite/" method="POST">
		<h2>{$aLang.registration_invite}</h2>

		<p><label>{$aLang.registration_invite_code}<br />
		<input type="text" name="invite_code" class="input-200" /></label></p>

        <div class="button2">
            <em></em><span></span><input type="submit" name="submit_invite" value="{$aLang.registration_invite_check}" />
        </div>

	</form>
</div>
</div>


{include file='footer.light.tpl'}