{assign var="sidebarPosition" value='left'}
{include file='header.tpl'}

{include file='menu.talk.tpl'}

{assign var="oUser" value=$oTalk->getUser()}


<article class="topic topic-type-talk">

    <header class="topic-header">
        <div class="date">
    		<time datetime="{date_format date=$oTalk->getDate() format='c'}" pubdate title="{date_format date=$oTalk->getDate() format='j F Y, H:i'}">
    			{date_format date=$oTalk->getDate() format="j F Y, H:i"}
    		</time>
        </div>

    	<h3 class="topic-title">{$oTalk->getTitle()|escape:'html'}</h3>

        <div class="topic-info-favourite" onclick="return ls.favourite.toggle({$oTalk->getId()},$('#fav_topic_{$oTalk->getId()}'),'talk');"><i id="fav_topic_{$oTalk->getId()}" class="favourite {if $oTalk->getIsFavourite()}active{/if}"></i></div>

    	<ul class="info-top">
    		<li class="writer">{$aLang.author_topic}: <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>    
            <li><a href="{router page='talk'}delete/{$oTalk->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" onclick="return confirm('{$aLang.talk_inbox_delete_confirm}');">{$aLang.delete}</a></li>
            {hook run='talk_read_info_item' talk=$oTalk}
        </ul>
    </header>

	<div class="topic-content text">
		{$oTalk->getText()}
	</div>
	
	{include file='actions/ActionTalk/speakers.tpl'}
</article>

{assign var="oTalkUser" value=$oTalk->getTalkUser()}

{if !$bNoComments}
{include
	file='comment_tree.tpl'
	iTargetId=$oTalk->getId()
	sTargetType='talk'
	iCountComment=$oTalk->getCountComment()
	sDateReadLast=$oTalkUser->getDateLast()
	sNoticeCommentAdd=$aLang.topic_comment_add
	bNoCommentFavourites=true}
{/if}
			
			
{include file='footer.tpl'}