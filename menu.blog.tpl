<div class="navigation" {if $sAction=='index'}style="margin-left:0px"{/if}>
    <h2>
        {if $sMenuItemSelect=='index'}
            {$aLang.blog_menu_all}
        {elseif $sMenuItemSelect=='blog'}
            {$aLang.blog_menu_collective}
        {elseif $sMenuItemSelect=='log'}
            {$aLang.blog_menu_personal}
        {/if}
    </h2>

    <ul>
        <li {if $sMenuItemSelect=='index'}class="active"{/if}><a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a></li>
        <li {if $sMenuItemSelect=='blog'}class="active"{/if}><a href="{router page='blog'}">{$aLang.blog_menu_collective}</a></li>
        <li {if $sMenuItemSelect=='log'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a></li>

	    {hook run='menu_blog'}
    </ul>
</div>
