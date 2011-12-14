
<div class="navigation">
    <h1>
        {if $sMenuItemSelect=='people'}
            {$aLang.people_page}
        {/if}
    </h1>

    <ul>
        <li {if $sEvent=='' || $sEvent=='good'}class="active"{/if}><a href="{router page='people'}">{$aLang.people_all}</a></li>
        <li {if $sEvent=='new'}class="active"{/if}><a href="{router page='people'}new/">{$aLang.people_new}</a></li>
        <li {if $sEvent=='online'}class="active"{/if}><a href="{router page='people'}online/">{$aLang.people_online}</a></li>
    </ul>
</div>