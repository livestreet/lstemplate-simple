<div class="navigation">
    <h1>
        {if $sMenuItemSelect=='index'}
            Все
        {elseif $sMenuItemSelect=='blog'}
            Коллективные
        {elseif $sMenuItemSelect=='personal_blog'}
            Персональные
        {/if}
    </h1>

    <ul>
        <li {if $sMenuItemSelect=='index'}class="active"{/if}><a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a></li>
        <li {if $sMenuItemSelect=='blog'}class="active"{/if}><a href="{router page='blog'}">{$aLang.blog_menu_collective}</a></li>
        <li {if $sMenuItemSelect=='log'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a></li>
    </ul>
</div>
