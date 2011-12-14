
<div class="navigation">
    <h1>
        {if $sMenuItemSelect=='settings'}
            {$aLang.settings_nav}
        {/if}
    </h1>

    <ul>
        <li {if $sMenuSubItemSelect=='profile'}class="active"{/if}><a href="{router page='settings'}profile/">{$aLang.settings_profile}</a></li>
        <li {if $sMenuSubItemSelect=='tuning'}class="active"{/if}><a href="{router page='settings'}tuning/">{$aLang.settings_tuning}</a></li>
        {if $oConfig->GetValue('general.reg.invite')}<li {if $sMenuItemSelect=='invite'}class="active"{/if}><a href="{router page='settings'}invite/">{$aLang.settings_invite}</a></li>{/if}
    </ul>
</div>