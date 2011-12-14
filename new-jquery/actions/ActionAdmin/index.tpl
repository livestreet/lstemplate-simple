{include file='header.tpl'}


<div class="inside">
<h2>Админ-панель</h2>
<ul>
    <li><a href="{router page="admin"}plugins">{$aLang.admin_list_plugins}</a></li>
    <li><a href="{router page="admin"}userfields">{$aLang.admin_list_userfields}</a></li>
    <li><a href="{router page="admin"}restorecomment">{$aLang.admin_list_restorecomment}</a></li>
    {hook run='admin_action_item'}
</ul>
</div>

{include file='footer.tpl'}