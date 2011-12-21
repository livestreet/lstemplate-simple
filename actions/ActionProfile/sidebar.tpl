{if $oUserProfile}

    {if $aUsersFriend}
	<div class="block account">
        <h2>{$aLang.friends_h2}</h2>

        <ul class="friend-list">
        {foreach from=$aUsersFriend item=oUser}
            <li><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" title="{$oUser->getLogin()}" /></a></li>
        {/foreach}
        </ul>
	</div>
    {/if}


    {if $aBlogsOwner}
	<div class="block account">
        <h2>{$aLang.self_h2}</h2>

        <ul class="blog-list">
		    {foreach from=$aBlogsOwner item=oBlog name=blog_owner}
		        <li {if $smarty.foreach.blog_owner.iteration == 1}style="border-top:0px; padding-top:0px"{/if}>
                    <a href="{router page='blog'}{$oBlog->getUrl()}/"><img src="{$oBlog->getAvatarPath(48)}" alt="avatar" class="avatar" title="{$oBlog->getTitle()|escape:'html'}" /></a>
                    <div class="infa"><a href="{router page='blog'}{$oBlog->getUrl()}/">{$oBlog->getTitle()|escape:'html'}</a></div>
                    <span>{$oBlog->getRating()}</span>
                </li>
            {/foreach}
        </ul>
	</div>
    {/if}

    {if $aBlogUsers}
	<div class="block account">
        <h2>{$aLang.join_h2}</h2>

        <ul class="blog-list">
          {foreach from=$aBlogUsers item=oBlogUser name=blog_user}
              {assign var="oBlog" value=$oBlogUser->getBlog()}
		        <li {if $smarty.foreach.blog_user.iteration == 1}style="border-top:0px; padding-top:0px"{/if}>
                    <a href="{router page='blog'}{$oBlog->getUrl()}/"><img src="{$oBlog->getAvatarPath(48)}" alt="avatar" class="avatar" title="{$oBlog->getTitle()|escape:'html'}" /></a>
                    <div class="infa"><a href="{router page='blog'}{$oBlog->getUrl()}/">{$oBlog->getTitle()|escape:'html'}</a></div>
                    <span>{$oBlog->getRating()}</span>
                </li>
              {/foreach}
        </ul>
	</div>
    {/if}

{/if}