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

     <div class="button2 button-primary l-b">
        <em></em><span></span><button type="submit"  name="submit_reactivation" id="reactivation-form-submit" disabled="disabled">{$aLang.reactivation_submit}</button>  
     </div>

</form>
</div>


{include file='footer.tpl'}