{include file='header.tpl' menu='talk' showUpdateButton=true}

{assign var="oUser" value=$oTalk->getUser()}


<div class="topic">

    <div class="date">{date_format date=$oTalk->getDate()}</div>

	<h1 class="title">
	    {$oTalk->getTitle()|escape:'html'}
	</h1>

	<a href="#" onclick="return ls.favourite.toggle({$oTalk->getId()},this,'talk');" class="favourite {if $oTalk->getIsFavourite()}active{/if}"></a>

	<ul class="info-top">
		<li class="writer">написал: <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
        <li class="delete"><a href="{router page='talk'}delete/{$oTalk->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" onclick="return confirm('{$aLang.talk_inbox_delete_confirm}');" class="delete">{$aLang.talk_inbox_delete}</a></li>
    </ul>

	<div class="content">
	    {$oTalk->getText()}
	</div>

</div>

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