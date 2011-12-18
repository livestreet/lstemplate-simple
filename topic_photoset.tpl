{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<script type="text/javascript">
jQuery(window).load(function($) {
	ls.photoset.showMainPhoto({$oTopic->getId()});
});
</script>

{if $sAction=='index'}

    {include file='topic_main_photoset.tpl'}

{else}

<div class="topic photo">

    <div class="date">{date_format date=$oTopic->getDateAdd() format="d F Y"}</div>

	<h1 class="title">
	    <a href="{$oTopic->getUrl()}" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>
	</h1>

	<a href="#" onclick="return ls.favourite.toggle({$oTopic->getId()},this,'topic');" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"></a>

	<ul class="info-top">
		<li class="writer">{$aLang.author_topic}: <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
        <li class="view">{$oTopic->getCountRead()}</li>
        <li class="comments-link"><a href="{$oTopic->getUrl()}#comments">{$oTopic->getCountComment()}</a></li>
        {if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
            <li><a href="{cfg name='path.root.web'}/{$oTopic->getType()}/edit/{$oTopic->getId()}/" title="{$aLang.topic_edit}">{$aLang.topic_edit}</a></li>
        {/if}
        {if $oUserCurrent and ($oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
            <li><a href="{router page='topic'}delete/{$oTopic->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');">{$aLang.topic_delete}</a></li>
        {/if}
	</ul>

    <div class="topic-photo-preview" onclick="window.location='{$oTopic->getUrl()}#photoset'" id="photoset-main-preview-{$oTopic->getId()}">
        {assign var=oMainPhoto value=$oTopic->getPhotosetMainPhoto()}
		<div class="topic-photo-count" id="photoset-photo-count-{$oTopic->getId()}"><span>{$oTopic->getPhotosetCount()}</span></div>
		{if $oMainPhoto->getDescription()}
			<div class="topic-photo-desc" id="photoset-photo-desc-{$oTopic->getId()}">{$oMainPhoto->getDescription()}</div>
		{/if}
		<img src="{$oMainPhoto->getWebPath(500)}" alt="image" id="photoset-main-image-{$oTopic->getId()}" />
	</div>

    {assign var=iPhotosCount value=$oTopic->getPhotosetCount()}
	<div class="content">
	{if $bTopicList}
        {$oTopic->getTextShort()}
        {if $oTopic->getTextShort()!=$oTopic->getText()}
          <a href="{$oTopic->getUrl()}#cut" title="{$aLang.topic_read_more}">
          {if $oTopic->getCutText()}
              {$oTopic->getCutText()}
          {else}
            {$aLang.topic_photoset_show_all|ls_lang:"COUNT%%`$iPhotosCount`"} &rarr;
          {/if}
          </a>
        {/if}
    {else}
        {$oTopic->getText()}
    {/if}
	</div>


	{if !$bTopicList}
		<script type="text/javascript" src="{cfg name='path.root.engine_lib'}/external/prettyPhoto/js/prettyPhoto.js"></script>
		<link rel='stylesheet' type='text/css' href="{cfg name='path.root.engine_lib'}/external/prettyPhoto/css/prettyPhoto.css" />
		<script type="text/javascript">
		    jQuery(document).ready(function($) {
		        $('.photoset-image').prettyPhoto({
		               social_tools:'',
		               show_title: false,
		               slideshow:false,
		               deeplinking: false
		        });
		    });
		</script>

		<div class="topic-photo-images">
			<h2>{$oTopic->getPhotosetCount()} {$oTopic->getPhotosetCount()|declension:$aLang.topic_photoset_count_images}</h2>
			<a name="photoset"></a>
			<ul id="topic-photo-images" >
				{assign var=aPhotos value=$oTopic->getPhotosetPhotos(0, $oConfig->get('module.topic.photoset.per_page'))}
				{if count($aPhotos)}
					{foreach from=$aPhotos item=oPhoto}
						<li><a class="photoset-image" href="{$oPhoto->getWebPath(1000)}" rel="[photoset]"  title="{$oPhoto->getDescription()}"><img src="{$oPhoto->getWebPath('50crop')}" alt="{$oPhoto->getDescription()}" /></a></li>
						{assign var=iLastPhotoId value=$oPhoto->getId()}
					{/foreach}
				{/if}
				<script type="text/javascript">
					ls.photoset.idLast='{$iLastPhotoId}';
				</script>
			</ul>
			{if count($aPhotos)<$oTopic->getPhotosetCount()}
				<a href="javascript:ls.photoset.getMore({$oTopic->getId()})" id="topic-photo-more" class="topic-photo-more">{$aLang.topic_photoset_show_more} &darr;</a>
			{/if}
		</div>
	{/if}

    <div class="tags">
		{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
			<a href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a>{if !$smarty.foreach.tags_list.last}, {/if}
		{/foreach}
	</div>

    <div class="info">
    {if !$bTopicList}
		{include file="block.addthis.tpl"}
    {/if}
      <div class="rating">
  	    <div id="vote_area_topic_{$oTopic->getId()}" class="voting {if $oVote || ($oUserCurrent && $oTopic->getUserId()==$oUserCurrent->getId()) || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}{if $oTopic->getRating()>0}positive{elseif $oTopic->getRating()<0}negative{/if}{/if} {if !$oUserCurrent || $oTopic->getUserId()==$oUserCurrent->getId() || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}guest{/if}{if $oVote} voted {if $oVote->getDirection()>0}plus{elseif $oVote->getDirection()<0}minus{/if}{/if}">
  			<a href="#" class="minus" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"></a>
  		    <span id="vote_total_topic_{$oTopic->getId()}" class="total" title="{$aLang.topic_vote_count}: {$oTopic->getCountVote()}">{if $oVote || ($oUserCurrent && $oTopic->getUserId()==$oUserCurrent->getId()) || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')} {if $oTopic->getRating()>0}+{/if}{$oTopic->getRating()} {else} <a href="#" onclick="return ls.vote.vote({$oTopic->getId()},this,0,'topic');">?</a> {/if}</span>
  			<a href="#" class="plus" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"></a>
  		</div>
      </div>
    </div>
	{if !$bTopicList}
		{hook run='topic_show_end' topic=$oTopic}
	{/if}
</div>
{/if}