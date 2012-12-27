{if $oUserCurrent}
	<div id="favourite-form-tags" class="modal">
		<header class="modal-header">
			<h3>{$aLang.add_favourite_tags}</h3>
			<a href="#" class="close jqmClose"></a>
		</header>
		
		<form onsubmit="return ls.favourite.saveTags(this);" class="modal-content" style="padding-top:15px">
			<input type="hidden" name="target_type" value="" id="favourite-form-tags-target-type">
			<input type="hidden" name="target_id" value="" id="favourite-form-tags-target-id">

			<p><input type="text" name="tags" value="" id="favourite-form-tags-tags" class="autocomplete-tags-sep input-text input-width-full"></p>

            <button type="submit" class="button2 left" name="" />
                        <div class="l"></div>
                        <div class="r"></div>{$aLang.favourite_form_tags_button_save}</button>

            <button type="submit"  name="" class="button2 jqmClose" />
                        <div class="l"></div>
                        <div class="r"></div>{$aLang.favourite_form_tags_button_cancel}</button>
		</form>
	</div>
{/if}