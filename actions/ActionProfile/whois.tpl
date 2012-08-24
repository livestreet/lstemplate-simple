{assign var="sidebarPosition" value='left'}
{assign var="sMenuItemSelect" value='profile'}
{include file='header.tpl'}

{assign var="oSession" value=$oUserProfile->getSession()}
{assign var="oVote" value=$oUserProfile->getVote()}
{assign var="oGeoTarget" value=$oUserProfile->getGeoTarget()}



{include file='actions/ActionProfile/profile_top.tpl'}
{include file='menu.profile_whois.tpl'}


<div class="user-profile-content">

    <div class="foto-profile">
        {if $oUserProfile->getProfileFoto()}
		    <img src="{$oUserProfile->getProfileFoto()}" alt="photo" />
        {else}
            <img src="{cfg name='path.static.skin'}/images/nofoto.jpg" alt="photo" />
	    {/if}

        {if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
        <div class="friend">
            {include file='actions/ActionProfile/friend_item.tpl' oUserFriend=$oUserProfile->getUserFriend()}
        </div>
        {/if}
    </div>

    <div class="about-profile">
        {if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
          	<script type="text/javascript">
          		jQuery(function($){
          			ls.lang.load({lang_load name="profile_user_unfollow,profile_user_follow"});
          		});
          	</script>
            <div class="send-message button2"><em></em><span></span><a href="{router page='talk'}add/?talk_users={$oUserProfile->getLogin()}">{$aLang.write_message}</a></div>
            <div class="send-message button2" style="right:158px"><em></em><span></span>
					<a href="#" onclick="ls.user.followToggle(this, {$oUserProfile->getId()}); return false;" class="{if $oUserProfile->isFollow()}followed{/if}">
						{if $oUserProfile->isFollow()}{$aLang.profile_user_unfollow}{else}{$aLang.profile_user_follow}{/if}
					</a>
            </div>
        {/if}

        <h2>{if $oUserProfile->getProfileName()}{$oUserProfile->getProfileName()}{else}{$oUserProfile->getLogin()}{/if}</h2>

		{if $oGeoTarget}
            <p class="where">
				<strong itemprop="address" itemscope itemtype="http://data-vocabulary.org/Address">
					{if $oGeoTarget->getCountryId()}
						<a href="{router page='people'}country/{$oGeoTarget->getCountryId()}/" itemprop="country-name">{$oUserProfile->getProfileCountry()|escape:'html'}</a>{if $oGeoTarget->getCityId()},{/if}
					{/if}

					{if $oGeoTarget->getCityId()}
						<a href="{router page='people'}city/{$oGeoTarget->getCityId()}/" itemprop="locality">{$oUserProfile->getProfileCity()|escape:'html'}</a>
					{/if}
				</strong>
            </p>
        {/if}

        <ul class="list-about">
            {assign var="aUserFieldValues" value=$oUserProfile->getUserFieldValues(true,array(''))}
            <li><span>{$aLang.profile_date_registration}:</span><strong>{date_format date=$oUserProfile->getDateRegister()}</strong></li>

            {if $oUserProfile->getProfileSex()!='other'}
            <li>
                <span>{$aLang.profile_sex}:</span>
                <strong>
                {if $oUserProfile->getProfileSex()=='man'}
				    {$aLang.profile_sex_man}
				{else}
				    {$aLang.profile_sex_woman}
				{/if}</strong>
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

    		{if $aUserFieldValues}
    			{foreach from=$aUserFieldValues item=oField}
    				<li>
    					<span><i class="icon-contact icon-contact-{$oField->getName()}"></i> {$oField->getTitle()|escape:'html'}:</span>
    					<strong>{$oField->getValue(true,true)}</strong>
    				</li>
    			{/foreach}
    		{/if}

            <br />
            {if $oUserProfile->getProfileAbout()}<li><span>{$aLang.profile_about}:</span><strong>{$oUserProfile->getProfileAbout()|escape:'html'}</strong></li>{/if}
            <br />

    		{assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('contact'))}
    		{if $aUserFieldContactValues}
                <li><span>{$aLang.profile_contacts}:</span>
                  <strong class="soc">
    				{foreach from=$aUserFieldContactValues item=oField}
    					<p><i class="icon-contact icon-contact-{$oField->getName()}" title="{$oField->getName()}"></i> {$oField->getValue(true,true)}</p>
    				{/foreach}
                  </strong>
                </li>
    		{/if}
            <br />
    		{assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('social'))}
    		{if $aUserFieldContactValues}
                <li><span>{$aLang.profile_soc}:</span>
                  <strong class="soc">
    				{foreach from=$aUserFieldContactValues item=oField}
    					<p><i class="icon-contact icon-contact-{$oField->getName()}" title="{$oField->getName()}"></i> {$oField->getValue(true,true)}</p>
    				{/foreach}
                  </strong>
                </li>
    		{/if}

    		{hook run='profile_whois_item' oUserProfile=$oUserProfile}
		</ul>

		{hook run='profile_whois_privat_item' oUserProfile=$oUserProfile}
		{hook run='profile_whois_item' oUserProfile=$oUserProfile}
		{hook run='profile_whois_activity_item' oUserProfile=$oUserProfile}
    </div>
</div>

{include file='block.simpleProfileTopics.tpl'}
{include file='block.simpleProfileComments.tpl'}

{include file='footer.tpl'}