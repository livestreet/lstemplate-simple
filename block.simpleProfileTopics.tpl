{if $simpletpl_aTopicsProfile and count($simpletpl_aTopicsProfile)}
<div class="user-profile-topics">
	<div class="user-profile-topics-inner">

		<div class="zagolovok">
			<h2>{$aLang.topics_h2}</h2>
			<a href="{router page='my'}{$oUserProfile->getLogin()}/">{$aLang.all_topics}</a>
		</div>

		{foreach from=$simpletpl_aTopicsProfile item=oTopic}
			{assign var="oUser" value=$oTopic->getUser()}
			<div class="topicshort {if $oTopic->getType()=='photoset'}photo1{/if}">
				<div class="inform">
					{if $oTopic->getType()=='photoset'}
						{assign var=oMainPhoto value=$oTopic->getPhotosetMainPhoto()}
						<div class="topic-photo-preview" onclick="window.location='{$oTopic->getUrl()}#photoset'">
							<div class="topic-photo-count"><span>{$oTopic->getPhotosetCount()}</span></div>
							<img src="{$oMainPhoto->getWebPath('229crop')}" alt="image" />
						</div>
					{/if}
					<h1 class="title">
						<a href="{$oTopic->getUrl()}" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>
					</h1>

					<div class="content">
						{$oTopic->getTextShort()}
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
		{/foreach}

	</div>
</div>
{/if}