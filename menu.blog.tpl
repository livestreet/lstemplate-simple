{if $sAction=='index' and $sEvent=='top'}
	<div class="navigation">
		<h2>{$aLang.slider_title_best}</h2>

		<ul>
    		<li {if $sPeriodSelectCurrent=='1'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=1">{$aLang.blog_menu_top_period_24h}</a></li>
    		<li {if $sPeriodSelectCurrent=='7'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=7">{$aLang.blog_menu_top_period_7d}</a></li>
    		<li {if $sPeriodSelectCurrent=='30'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=30">{$aLang.blog_menu_top_period_30d}</a></li>
    		<li {if $sPeriodSelectCurrent=='all'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=all">{$aLang.blog_menu_top_period_all}</a></li>
		</ul>
	</div>
{elseif $sAction=='index' and !($sEvent=='newall' or $sEvent=='discussed' or $sEvent=='new')}
	<div class="navigation">
		<h2>
			{if $sMenuItemSelect=='index'}
				{$aLang.blog_menu_all}
			{elseif $sMenuItemSelect=='blog'}
				{$aLang.blog_menu_collective}
			{elseif $sMenuItemSelect=='log'}
				{$aLang.blog_menu_personal}
			{elseif $sMenuItemSelect=='feed'}
				{$aLang.userfeed_title}
			{/if}
		</h2>

		<ul>
			<li {if $sMenuItemSelect=='index'}class="active"{/if}><a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a></li>
			<li {if $sMenuItemSelect=='blog'}class="active"{/if}><a href="{router page='blog'}">{$aLang.blog_menu_collective}</a></li>
			<li {if $sMenuItemSelect=='log'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a></li>       

			{hook run='menu_blog'}
		</ul>
	</div>
{/if}