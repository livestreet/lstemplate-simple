
<div class="navigation">
    <h1>
        {if $sEvent=='inbox'}
            {$aLang.talk_menu_inbox_list}
        {elseif $sEvent=='add'}
            {$aLang.talk_menu_inbox_create}
        {elseif $sEvent=='favourites'}
            {$aLang.talk_menu_inbox_favourites}
        {/if}
    </h1>

    <ul>
        <li {if $sEvent=='inbox'}class="active"{/if}><a href="{router page='talk'}">{$aLang.talk_menu_inbox_list}</a></li>
		<li {if $sEvent=='add'}class="active"{/if}><a href="{router page='talk'}add/">{$aLang.talk_menu_inbox_create}</a></li>
		<li {if $sEvent=='favourites'}class="active"{/if}><a href="{router page='talk'}favourites/">{$aLang.talk_menu_inbox_favourites} {if $iCountTalkFavourite} ({$iCountTalkFavourite}){/if}</a></li>
	</ul>
</div>