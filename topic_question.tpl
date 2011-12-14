{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}


{if $sAction=='index'}
    {include file='topic_main.tpl'}
{else}

<div class="topic">

    <div class="date">{date_format date=$oTopic->getDateAdd() format="d F Y"}</div>

	<h1 class="title">
	    <a href="{$oTopic->getUrl()}" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>
	</h1>

	<a href="#" onclick="return ls.favourite.toggle({$oTopic->getId()},this,'topic');" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"></a>

	<ul class="info-top">
		<li class="writer">{$aLang.author_topic}: <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
        <li class="view">116</li>
        <li class="comments-link"><a href="{$oTopic->getUrl()}#comments">{$oTopic->getCountComment()}</a></li>
        {if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
            <li><a href="{cfg name='path.root.web'}/{$oTopic->getType()}/edit/{$oTopic->getId()}/" title="{$aLang.topic_edit}">{$aLang.topic_edit}</a></li>
        {/if}
        {if $oUserCurrent and ($oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
            <li><a href="{router page='topic'}delete/{$oTopic->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');">{$aLang.topic_delete}</a></li>
        {/if}
	</ul>

    {if !$bTopicList}
    <div id="topic_question_area_{$oTopic->getId()}" class="poll">
		{if !$oTopic->getUserQuestionIsVote()}
			<ul class="poll-vote">
				{foreach from=$oTopic->getQuestionAnswers() key=key item=aAnswer}
					<li><label><input type="radio" id="topic_answer_{$oTopic->getId()}_{$key}" name="topic_answer_{$oTopic->getId()}" value="{$key}" onchange="$('#topic_answer_{$oTopic->getId()}_value').val($(this).val());" /> {$aAnswer.text|escape:'html'}</label></li>
				{/foreach}
			</ul>

            <div class="button2" style="margin-left:0px; float:left"><em></em><span></span><input type="submit" value="{$aLang.topic_question_vote}" onclick="ls.poll.vote({$oTopic->getId()},$('#topic_answer_{$oTopic->getId()}_value').val());" /></div>
            <div class="button2" style="float:left"><em></em><span></span><input type="submit" value="{$aLang.topic_question_abstain}" onclick="ls.poll.vote({$oTopic->getId()},-1)" /></div>
            <input type="hidden" id="topic_answer_{$oTopic->getId()}_value" value="-1" />

			<p class="poll-total" style="clear:both; margin-top:50px; margin-left:2px">{$aLang.topic_question_vote_result}: {$oTopic->getQuestionCountVote()}, {$aLang.topic_question_abstain_result}: {$oTopic->getQuestionCountVoteAbstain()}</p>
		{else}
			<ul class="poll-result">
				{foreach from=$oTopic->getQuestionAnswers() key=key item=aAnswer}
					<li {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}class="most"{/if}>
						<dl>
							<dt>
								<strong>{$oTopic->getQuestionAnswerPercent($key)}%</strong><br />
								<span>({$aAnswer.count})</span>
							</dt>
							<dd>{$aAnswer.text|escape:'html'}<div style="width: {$oTopic->getQuestionAnswerPercent($key)}%;" ></div></dd>
						</dl>
					</li>
				{/foreach}
			</ul>

			<p class="poll-total">{$aLang.topic_question_vote_result}: {$oTopic->getQuestionCountVote()}, {$aLang.topic_question_abstain_result}: {$oTopic->getQuestionCountVoteAbstain()}</p>
		{/if}
	</div>
    {/if}

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
        {$oTopic->getText()}
    {/if}
	</div>

    <div class="info">
    {if !$bTopicList}
      <ul>
          <li class="share">{$aLang.share}</li>
          <li class="vk"><a href="/" title="VKONTAKTE"></a></li>
          <li class="fb"><a href="/" title="FACEBOOK"></a></li>
          <li class="tw"><a href="/" title="TWITTER"></a></li>
          <li class="lj"><a href="/" title="LIVEJOURNAL"></a></li>
      </ul>
    {/if}
      <div class="rating">
  	    <div id="vote_area_topic_{$oTopic->getId()}" class="voting {if $oVote || ($oUserCurrent && $oTopic->getUserId()==$oUserCurrent->getId()) || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}{if $oTopic->getRating()>0}positive{elseif $oTopic->getRating()<0}negative{/if}{/if} {if !$oUserCurrent || $oTopic->getUserId()==$oUserCurrent->getId() || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}guest{/if}{if $oVote} voted {if $oVote->getDirection()>0}plus{elseif $oVote->getDirection()<0}minus{/if}{/if}">
  			<a href="#" class="minus" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"></a>
  		    <span id="vote_total_topic_{$oTopic->getId()}" class="total" title="{$aLang.topic_vote_count}: {$oTopic->getCountVote()}">{if $oVote || ($oUserCurrent && $oTopic->getUserId()==$oUserCurrent->getId()) || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')} {if $oTopic->getRating()>0}+{/if}{$oTopic->getRating()} {else} <a href="#" onclick="return ls.vote.vote({$oTopic->getId()},this,0,'topic');">?</a> {/if}</span>
  			<a href="#" class="plus" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"></a>
  		</div>
      </div>
    </div>

</div>
{/if}