<ul class="list">
	{foreach from=$oTopics item=oTopic name="cmt"}
		{assign var="oUser" value=$oTopic->getUser()}							
		{assign var="oBlog" value=$oTopic->getBlog()}

        <li>
            <a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(48)}" class="avatar" alt="avatar" /></a>
            <div class="information">
                <a href="{$oTopic->getUrl()}#comment" class="stream-comment-icon">{$oTopic->getCountComment()}</a>

                <a href="{$oUser->getUserWebPath()}" class="user">{$oUser->getLogin()}</a><span class="date">{date_format date=$oTopic->getDate() format="d.m.Y"}</span><br />
    			<a href="{$oTopic->getUrl()}" class="topic-title">{$oTopic->getTitle()|escape:'html'}</a>
            </div>
        </li>
	{/foreach}				
</ul>
