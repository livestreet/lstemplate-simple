{include file='header.tpl' menu='profile'}

{assign var="oSession" value=$oUserProfile->getSession()}
{assign var="oVote" value=$oUserProfile->getVote()}

<div class="inside">

<div class="user-profile">

	<div id="vote_area_user_{$oUserProfile->getId()}" class="voting {if $oUserProfile->getRating()>=0}positive{else}negative{/if} {if !$oUserCurrent || $oUserProfile->getId()==$oUserCurrent->getId()}guest{/if} {if $oVote} voted {if $oVote->getDirection()>0}plus{elseif $oVote->getDirection()<0}minus{/if}{/if}">
		<div class="text">{$aLang.blog_rating}</div>
		<a href="#" class="plus" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"></a>
		<div id="vote_total_user_{$oUserProfile->getId()}" class="total" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}">{$oUserProfile->getRating()}</div>
        <a href="#" class="minus" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"></a>
	</div>

	<div class="strength">
		<div class="text">{$aLang.user_skill}</div>
		<div class="total" id="user_skill_{$oUserProfile->getId()}">{$oUserProfile->getSkill()}</div>
	</div>

	<img src="{$oUserProfile->getProfileAvatarPath(48)}" alt="avatar" class="avatar" />
	<h2>{$oUserProfile->getLogin()}</h2>
	{if $oSession}
    	<p class="last">{$aLang.last_visit}:&nbsp;&nbsp;<span>{date_format date=$oSession->getDateLast()}</span></p>
	{/if}
</div>

<div class="user-profile-content">

    <div class="foto-profile">
        {if $oUserProfile->getProfileFoto()}
		    <img src="{$oUserProfile->getProfileFoto()}" alt="photo" />
        {else}
            <img src="{cfg name='path.static.skin'}/images/nofoto.png" alt="photo" />
	    {/if}

        {if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
        <div class="friend">
            {include file='actions/ActionProfile/friend_item.tpl' oUserFriend=$oUserProfile->getUserFriend()}
        </div>
        {/if}
    </div>

    <div class="about-profile">
        {if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
            <div class="send-message button2"><em></em><span></span><a href="{router page='talk'}add/?talk_users={$oUserProfile->getLogin()}">{$aLang.write_message}</a></div>
        {/if}

        <h2>{if $oUserProfile->getProfileName()}{$oUserProfile->getProfileName()}{else}{$oUserProfile->getLogin()}{/if}</h2>
        <p class="where">
        {if $oUserProfile->getProfileCountry()}
            <a href="{router page='people'}country/{$oUserProfile->getProfileCountry()|escape:'html'}/">{$oUserProfile->getProfileCountry()|escape:'html'}</a>{if $oUserProfile->getProfileCity()},{/if}
        {/if}
        {if $oUserProfile->getProfileCity()}
            <a href="{router page='people'}city/{$oUserProfile->getProfileCity()|escape:'html'}/">{$oUserProfile->getProfileCity()|escape:'html'}</a>
        {/if}
        </p>

        <ul class="list-about">
            <li><span>{$aLang.profile_date_registration}:</span>{date_format date=$oUserProfile->getDateRegister()}</li>

            {if $oUserProfile->getProfileSex()!='other'}
            <li>
                <span>{$aLang.profile_sex}:</span>
                {if $oUserProfile->getProfileSex()=='man'}
				    {$aLang.profile_sex_man}
				{else}
				    {$aLang.profile_sex_woman}
				{/if}
            </li>
            {/if}

            {if $oUserProfile->getProfileBirthday()}
                <li><span>{$aLang.profile_birthday}:</span>{date_format date=$oUserProfile->getProfileBirthday() format="j F Y"}</li>
            {/if}

            {if $oUserProfile->getProfileSite()}
              <li>
                  <span>{$aLang.profile_site}:</span>
                  <a href="{$oUserProfile->getProfileSite(true)|escape:'html'}" rel="nofollow">
                  {if $oUserProfile->getProfileSiteName()}
                      {$oUserProfile->getProfileSiteName()|escape:'html'}
                  {else}
                      {$oUserProfile->getProfileSite()|escape:'html'}
                  {/if}
                  </a>
              </li>
            {/if}


			{if $oUserProfile->getProfileIcq()}
				<li class="social-profile"><span>{$aLang.social_profile}:</span>
					{if $oUserProfile->getProfileIcq()}
						<a class="icq" href="http://www.icq.com/people/about_me.php?uin={$oUserProfile->getProfileIcq()|escape:'html'}" target="_blank"></a></li>
					{/if}
				</li>
			{/if}

            {if $oUserProfile->getProfileAbout()}<li class="about"><span>{$aLang.profile_about}:</span>{$oUserProfile->getProfileAbout()|escape:'html'}</li>{/if}

        {hook run='profile_whois_item' oUserProfile=$oUserProfile}
        </ul>
    </div>
</div>


{$aBlockParams.user=$oUserProfile}
{insert name="block" block=simpleProfileTopics params=$aBlockParams}

{insert name="block" block=simpleProfileComments params=$aBlockParams}


</div>


{include file='footer.tpl'}