<script type="text/javascript">
	jQuery(window).load(function () {
		var trigger = $('#dropdown-create-trigger');
		var menu 	= $('#dropdown-create-menu');
		var pos 	= trigger.offset();
	
	
		// Dropdown
		menu.find('li.active').prependTo(menu).click(function(){
			menu.hide();
			return false;
		});
		menu.appendTo('body').css({ 'left': pos.left - 18, 'top': pos.top - 13, 'display': 'none' });

		trigger.click(function(){
			menu.toggle(); 
			return false;
		});
		

		// Hide menu
		$(document).click(function(){
			menu.hide();
		});

		$('body').on("click", "#dropdown-create-trigger, #dropdown-create-menu", function(e) {
			e.stopPropagation();
		});

		$(window).resize(function(){
			menu.css({ 'left': $('#dropdown-create-trigger').offset().left - 18 });
		});
	});
</script>


	<div class="navigation">
		<h2>{$aLang.block_create}</h2>

		<ul>
    		<li {if $sMenuSubItemSelect=='topic'}class="active"{/if}><a href="{router page='topic'}add/">{$aLang.topic_menu_add_topic}</a></li>
    		<li {if $sMenuSubItemSelect=='question'}class="active"{/if}><a href="{router page='question'}add/">{$aLang.topic_menu_add_question}</a></li>
    		<li {if $sMenuSubItemSelect=='link'}class="active"{/if}><a href="{router page='link'}add/">{$aLang.topic_menu_add_link}</a></li>
    		<li {if $sMenuSubItemSelect=='photoset'}class="active"{/if}><a href="{router page='photoset'}add/">{$aLang.topic_menu_add_photoset}</a></li>
    		<li {if $sAction=='blog' and $sEvent=='add'}class="active"{/if}><a href="{router page='blog'}add/">{$aLang.blog_add}</a></li>
    		{hook run='menu_create_topic_item'}
        	{if $iUserCurrentCountTopicDraft}
        		<li {if $sAction=='topic' and $sEvent=='saved'}class="active"{/if}><a href="{router page='topic'}saved/" class="drafts">{$aLang.topic_menu_saved} ({$iUserCurrentCountTopicDraft})</a></li>
        	{/if}
		</ul>
	</div>

{hook run='menu_create' sMenuItemSelect=$sMenuItemSelect sMenuSubItemSelect=$sMenuSubItemSelect}