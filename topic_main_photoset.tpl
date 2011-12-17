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

	<h1 class="title">
	    <a href="{$oTopic->getUrl()}" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>
	</h1>
    </div>

	<ul class="info">
        <li class="avatar"><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" /></a></li>
		<li class="username">
            <a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a><br />
            {date_format date=$oTopic->getDateAdd() format="d.m.Y"}
        </li>
		{if $bTopicList}
		<li class="comments-link">
		    <a href="{$oTopic->getUrl()}#comments">{$oTopic->getCountComment()}</a>
		</li>
		{/if}
	</ul>
</div>