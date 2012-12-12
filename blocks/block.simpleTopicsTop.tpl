{if $simpletpl_aTopicsTop and count($simpletpl_aTopicsTop)}

<script type="text/javascript">
    jQuery(document).ready(function($){
        ls.plugin.simpletpl.init({$simpletpl_iCountSlide});
    });
</script>
<div class="slider-nav">
    <h2 class="title-best">{$aLang.slider_title_best}</h2>

    <div class="switch">
        <ul>
            <li class="arrowleft"><a href="#" id="simple-topictop-nav-prev" onclick="return ls.plugin.simpletpl.prev();"></a></li>
			{section name=num_slide start=1 loop=$simpletpl_iCountSlide+1 step=1}
                <li><a href="#" id="simple-topictop-nav-page-{$smarty.section.num_slide.index}" onclick="return ls.plugin.simpletpl.page({$smarty.section.num_slide.index});" {if $smarty.section.num_slide.first}class="active"{/if}></a></li>
			{/section}
			<li class="arrowright"><a href="#" id="simple-topictop-nav-next" onclick="return ls.plugin.simpletpl.next();"></a></li>
        </ul>
    </div>
</div>

<div id="slider">
    <div id="slider-hidden">

		{foreach from=$simpletpl_aTopicsTop item=oTopic}
			{assign var="oUser" value=$oTopic->getUser()}
            <div class="topic-slider">
                <div class="topicshort {if $oTopic->getType()=='photoset' or $oTopic->getPreviewImage()}photo2{else}news{/if}">
                    <div class="inform">
						{if $oTopic->getType()=='photoset' and $oTopic->getPreviewImage()}
							<div class="topic-photo-preview" onclick="window.location='{$oTopic->getUrl()}#photoset'">
                                <div class="topic-photo-count"><span>{$oTopic->getPhotosetCount()}</span></div>
                                <img src="{$oTopic->getPreviewImageWebPath('354crop')}" alt="image" />
                            </div>
						{elseif $oTopic->getPreviewImage()}
                            <div class="topic-photo-preview" onclick="window.location='{$oTopic->getUrl()}'">
                                <img src="{$oTopic->getPreviewImageWebPath('354crop')}" alt="image" />
                            </div>
						{/if}
                        <h3 class="title">
                            <a href="{$oTopic->getUrl()}" class="title-topic" title="{$oTopic->getTitle()|escape:'html'}">{$oTopic->getTitle()|escape:'html'}</a>
                        </h3>

                        <div class="content">
							{$oTopic->getTextShort()|strip_tags|truncate:450:'...'}
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
            </div>
		{/foreach}

    </div>
</div>
{/if}