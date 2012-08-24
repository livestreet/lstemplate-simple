{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}
<li class="topicshort {if $oTopic->getType()=='photoset' or $oTopic->getPreviewImage()}photo1{else}news{/if} {if Config::Get('plugin.simpletpl.show_titletwo')}titletwo{/if}">

    <div class="inform">
		{if $oTopic->getType()=='photoset'}
			<div class="topic-photo-preview" onclick="window.location='{$oTopic->getUrl()}#photoset'" id="photoset-main-preview-{$oTopic->getId()}">
				{assign var=oMainPhoto value=$oTopic->getPhotosetMainPhoto()}
				<div class="topic-photo-count" id="photoset-photo-count-{$oTopic->getId()}"><span>{$oTopic->getPhotosetCount()}</span></div>
				<img src="{$oMainPhoto->getWebPath(229)}" alt="image" id="photoset-main-image-{$oTopic->getId()}" />
			</div>
		{elseif $oTopic->getPreviewImage()}
			<div class="topic-photo-preview" onclick="window.location='{$oTopic->getUrl()}'">
				<img src="{$oTopic->getPreviewImageWebPath('229crop')}" alt="image" />
			</div>
		{/if}

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
</li>