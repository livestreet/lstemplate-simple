{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<script type="text/javascript">
jQuery(window).load(function($) {
	ls.photoset.showMainPhoto({$oTopic->getId()});
});
</script>

<div class="topicshort photo1">

    <div class="inform">
		<div class="topic-photo-preview" onclick="window.location='{$oTopic->getUrl()}#photoset'" id="photoset-main-preview-{$oTopic->getId()}">
			{assign var=oMainPhoto value=$oTopic->getPhotosetMainPhoto()}
			<div class="topic-photo-count" id="photoset-photo-count-{$oTopic->getId()}"><span>{$oTopic->getPhotosetCount()}</span></div>
			<img src="{$oMainPhoto->getWebPath('229crop')}" alt="image" id="photoset-main-image-{$oTopic->getId()}" />
		</div>

		{assign var=iPhotosCount value=$oTopic->getPhotosetCount()}


		<h3 class="title">
			<a href="{$oTopic->getUrl()}" class="title-topic" title="{$oTopic->getTitle()|escape:'html'}">{$oTopic->getTitle()|escape:'html'}</a>
		</h3>
    </div>

	<ul class="info">
        <li class="avatar"><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" /></a></li>
		<li class="username">
            <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a><br />
            {date_format date=$oTopic->getDateAdd() format="d.m.Y"}
        </li>
		<li class="comments-link">
		    <a href="{$oTopic->getUrl()}#comments">{$oTopic->getCountComment()}</a>
		</li>
	</ul>
</div>