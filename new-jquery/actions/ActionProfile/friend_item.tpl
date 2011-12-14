{if $oUserFriend and ($oUserFriend->getFriendStatus()==$USER_FRIEND_ACCEPT+$USER_FRIEND_OFFER or $oUserFriend->getFriendStatus()==$USER_FRIEND_ACCEPT+$USER_FRIEND_ACCEPT)}
	<a href="#"  title="{$aLang.user_friend_del}" onclick="return ls.user.removeFriend(this,{$oUserProfile->getId()},'del');" class="delete-friend"></a>
{elseif $oUserFriend and $oUserFriend->getStatusTo()==$USER_FRIEND_REJECT and $oUserFriend->getStatusFrom()==$USER_FRIEND_OFFER and $oUserFriend->getUserTo()==$oUserCurrent->getId()}
	<a href="#"  title="{$aLang.user_friend_add}" onclick="return ls.user.addFriend(this,{$oUserProfile->getId()},'accept');" class="add-friend"></a>
{elseif $oUserFriend and $oUserFriend->getFriendStatus()==$USER_FRIEND_OFFER+$USER_FRIEND_REJECT and $oUserFriend->getUserTo()!=$oUserCurrent->getId()}
	<span class="reject-friend"></span>
{elseif $oUserFriend and $oUserFriend->getFriendStatus()==$USER_FRIEND_OFFER+$USER_FRIEND_NULL and $oUserFriend->getUserFrom()==$oUserCurrent->getId()}
	<span class="send-friend"></span>
{elseif $oUserFriend and $oUserFriend->getFriendStatus()==$USER_FRIEND_OFFER+$USER_FRIEND_NULL and $oUserFriend->getUserTo()==$oUserCurrent->getId()}
	<a href="#"  title="{$aLang.user_friend_add}" onclick="return ls.user.addFriend(this,{$oUserProfile->getId()},'accept');" class="add-friend"></a>
{elseif !$oUserFriend}	
	<a href="#"  title="{$aLang.user_friend_add}" id="add_friend_show" class="add-friend"></a>
		<form id="add_friend_form" class="add-friend-form jqmWindow" onsubmit="return ls.user.addFriend(this,{$oUserProfile->getId()},'add');">
			<a href="#" class="close jqmClose"></a>
			
			<label for="add_friend_text">{$aLang.user_friend_add_text_label}</label><br />
			<textarea id="add_friend_text" rows="3"></textarea>
			
			<input type="submit" value="{$aLang.user_friend_add_submit}" />
		</form>
{else}
	<a href="#" title="{$aLang.user_friend_add}" onclick="return ls.user.addFriend(this,{$oUserProfile->getId()},'link');" class="add-friend"></a>
{/if}