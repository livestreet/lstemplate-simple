{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<article class="topic topic-type-{$oTopic->getType()} js-topic">

    <header class="topic-header">
        <div class="date">
    	    <time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
    	        {date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
    	    </time>
        </div>

    	<h3 class="topic-title">
    	    <a href="{$oTopic->getUrl()}" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>

			{if $oTopic->getPublish() == 0}
				<i class="icon-synio-topic-draft" title="{$aLang.topic_unpublish}"></i>
			{/if}

			{if $oTopic->getType() == 'link'}
				<i class="icon-synio-topic-link" title="{$aLang.topic_link}"></i>
			{/if}
    	</h3>

        <div class="topic-info-favourite" onclick="return ls.favourite.toggle({$oTopic->getId()},$('#fav_topic_{$oTopic->getId()}'),'topic');">
    	    <i id="fav_topic_{$oTopic->getId()}" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"></i>
    	    <span class="favourite-count" id="fav_count_topic_{$oTopic->getId()}">{if $oTopic->getCountFavourite()>0}{$oTopic->getCountFavourite()}{/if}</span>
    	</div>

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
    </header>