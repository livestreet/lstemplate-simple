<div class="navigation">
    <h2>
        {if $sEvent=='add'}
        	{$aLang.add}
        {else}
        	{$aLang.edit}
        {/if}
    </h2>

    <ul>
        <li {if $sMenuItemSelect=='topic'}class="active"{/if}><a href="{router page='topic'}add/">{$aLang.add_topic}</a></li>
        <li {if $sMenuItemSelect=='link'}class="active"{/if}><a href="{router page='link'}add/">{$aLang.add_link}</a></li>
        <li {if $sMenuItemSelect=='question'}class="active"{/if}><a href="{router page='question'}add/">{$aLang.add_question}</a></li>
        <li {if $sMenuItemSelect=='photoset'}class="active"{/if}><a href="{router page='photoset'}add/">{$aLang.add_photoset}</a></li>

        {hook run='menu_topic_action_add_item'}
        
        <li {if $sMenuItemSelect=='add_blog'}class="active"{/if}><a href="{router page='blog'}add/">{$aLang.add_blog}</a></li>
    </ul>
</div>
