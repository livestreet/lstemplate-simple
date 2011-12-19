{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<div class="topicshort">
    <div class="inform">
		<h3 class="title">
			<a href="{$oTopic->getUrl()}" class="title-topic" title="{$oTopic->getTitle()|escape:'html'}">{$oTopic->getTitle()|escape:'html'}</a>
		</h3>

		<div class="content">
			{$oTopic->getTextShort()|strip_tags|truncate:120:'...'}
		</div>
    </div>

	<ul class="info">
        <li class="avatar"><a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" /></a></li>
		<li class="username">
            <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a><br />
            {date_format date=$oTopic->getDateAdd() format="d.m.Y"}
        </li>
		<li class="comments-link">
		    <a href="{$oTopic->getUrl()}#comments">{$oTopic->getCountComment()}</a>
		</li>
	</ul>
</div>