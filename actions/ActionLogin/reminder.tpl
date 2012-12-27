{assign var="noSidebar" value=true}
{include file='header.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#reminder-form').bind('submit',function(){
			ls.user.reminder('reminder-form');
			return false;
		});
		$('#reminder-form-submit').attr('disabled',false);
	});
</script>
<div class="content-error">

<h2 class="page-header">{$aLang.password_reminder}</h2>

<form action="{router page='login'}reminder/" method="POST" id="reminder-form">
	<p><label for="reminder-mail">{$aLang.password_reminder_email}</label>
	<input type="text" name="mail" id="reminder-mail" class="input-text input-width-200" />
	<small class="validate-error-hide validate-error-reminder"></small></p>

     <button type="submit" class="button2" name="submit_reminder" id="reminder-form-submit" disabled="disabled">
            <div class="l"></div>
            <div class="r"></div>{$aLang.password_reminder_submit}</button>   

</form>
</div>



{include file='footer.tpl'}