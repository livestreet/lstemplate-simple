{assign var="sidebarPosition" value='left'}
{include file='header.tpl'}

<h2>{$aLang.user_menu_profile_friends}{if ($iCountFriendsUser)>0} ({$iCountFriendsUser}){/if}</h2>

{include file='user_list.tpl' aUsersList=$aFriends}



{include file='footer.tpl'}