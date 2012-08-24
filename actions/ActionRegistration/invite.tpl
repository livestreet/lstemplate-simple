{assign var="noSidebar" value=true}
{include file='header.tpl'}



<div class="content-error">
<h2 class="page-header">{$aLang.registration_invite}</h2>


<form action="{router page='registration'}invite/" method="POST">
	<p><label>{$aLang.registration_invite_code}:</label>
	<input type="text" name="invite_code" class="input-text input-width-300" /></p>

     <div class="button2 button-primary l-b">
        <em></em><span></span><input type="submit" name="submit_invite" value="{$aLang.registration_invite_check}" />
     </div>

</form>
</div>


{include file='footer.tpl'}