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
	<div id="add_friend_form" class="modal">
		<header class="modal-header">
			<h3>{$aLang.profile_add_friend}</h3>
			<a href="#" class="close jqmClose"></a>
		</header>

		<form onsubmit="return ls.user.addFriend(this,{$oUserProfile->getId()},'add');" class="modal-content">
			<p><label for="add_friend_text">{$aLang.user_friend_add_text_label}</label>
			<textarea id="add_friend_text" rows="3" class="input-text input-width-full"></textarea></p>

            <div class="button2 button-primary l-b">
                <em></em><span></span>
                <button type="submit">{$aLang.user_friend_add_submit}</button>
            </div>

		</form>
	</div>
	<a href="#"  title="{$aLang.user_friend_add}" id="add_friend_show" class="add-friend"></a>
{else}
	<a href="#" title="{$aLang.user_friend_add}" onclick="return ls.user.addFriend(this,{$oUserProfile->getId()},'link');" class="add-friend"></a>
{/if}