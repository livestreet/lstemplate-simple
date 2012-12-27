{assign var="noSidebar" value=true}
{include file='header.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#reactivation-form').bind('submit',function(){
			ls.user.reactivation('reactivation-form');
			return false;
		});
		$('#reactivation-form-submit').attr('disabled',false);
	});
</script>

<div class="content-error">
<h2 class="page-header">{$aLang.reactivation}</h2>

<form action="{router page='login'}reactivation/" method="POST" id="reactivation-form">
	<p><label for="reactivation-mail">{$aLang.password_reminder_email}</label>
	<input type="text" name="mail" id="reactivation-mail" class="input-text input-width-200" />
	<small class="validate-error-hide validate-error-reactivation"></small></p>

     <button type="submit" class="button2" name="submit_reactivation" id="reactivation-form-submit" disabled="disabled">
            <div class="l"></div>
            <div class="r"></div>{$aLang.reactivation_submit}</button>

</form>
</div>


{include file='footer.tpl'}