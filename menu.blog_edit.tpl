<div class="navigation">
    <h2>
        {if $sEvent=='add'}
        	{$aLang.add}
        {else}
        	{$aLang.edit}
        {/if}
    </h2>

    {if $sEvent=='add'}
    <ul>
        <li {if $sMenuItemSelect=='topic'}class="active"{/if}><a href="{router page='topic'}add/">{$aLang.add_topic}</a></li>
        <li {if $sMenuItemSelect=='link'}class="active"{/if}><a href="{router page='link'}add/">{$aLang.add_link}</a></li>
        <li {if $sMenuItemSelect=='question'}class="active"{/if}><a href="{router page='question'}add/">{$aLang.add_question}</a></li>
        <li {if $sMenuItemSelect=='photoset'}class="active"{/if}><a href="{router page='photoset'}add/">{$aLang.add_photoset}</a></li>
        <li {if $sMenuItemSelect=='blog'}class="active"{/if}><a href="{router page='blog'}add/">{$aLang.add_blog}</a></li>
    </ul>
    {else}
    <ul>
	    <li {if $sMenuItemSelect=='profile'}class="active"{/if}><a href="{router page='blog'}edit/{$oBlogEdit->getId()}/">{$aLang.profile_blog}</a></li>
	    <li {if $sMenuItemSelect=='admin'}class="active"{/if}><a href="{router page='blog'}admin/{$oBlogEdit->getId()}/">{$aLang.users_blog}</a></li>

	    {hook run='menu_blog_edit_admin_item'}
    </ul>
    
    {hook run='menu_blog_edit'}
    {/if}
</div>