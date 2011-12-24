{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}


<div class="topic">

    <div class="date">{date_format date=$oTopic->getDateAdd() format="d F Y"}</div>

	<h3 class="title">
	    <a href="{router page='link'}go/{$oTopic->getId()}/" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>
	</h3>

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

	<div class="content">
	{if $bTopicList}
        {$oTopic->getTextShort()}
        {if $oTopic->getTextShort()!=$oTopic->getText()}
          <a href="{$oTopic->getUrl()}#cut" title="{$aLang.topic_read_more}">
          {if $oTopic->getCutText()}
              {$oTopic->getCutText()}
          {else}
            &raquo;&raquo;&raquo;
          {/if}
          </a>
        {/if}
    {else}
        {$oTopic->getText()}<br /><br />
        {$aLang.link_go}: <a href="{router page='link'}go/{$oTopic->getId()}/" title="{$aLang.topic_link_count_jump}: {$oTopic->getLinkCountJump()}">{$oTopic->getLinkUrl(true)}</a>
    {/if}
	</div>

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