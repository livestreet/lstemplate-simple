{if $oTopic}
{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUserOwner" value=$oBlog->getOwner()}


<div class="blockabout">
    <div class="first-info">
        <img src="{$oTopic->getBlog()->getAvatarPath(48)}" alt="avatar" class="avatar" title="{$oTopic->getBlog()->getTitle()|escape:'html'}" />
        <h2><a href="{$oBlog->getUrlFull()}">{$oTopic->getBlog()->getTitle()|escape:'html'}</a></h2>
    </div>
    <div class="second-info">{$oTopic->getBlog()->getDescription()}</div>
    <div class="third-info"><b>1517</b> {$aLang.readers}, <b>442</b> {$aLang.posts}</div>
    {if $oUserCurrent}
    <div class="fourth-info">
        <div id="vote_area_blog_{$oTopic->getBlog()->getId()}" class="voting {if $oTopic->getBlog()->getRating()>0}positive{elseif $oTopic->getBlog()->getRating()<0}negative{/if} {if !$oUserCurrent || $oTopic->getBlog()->getOwnerId()==$oUserCurrent->getId()}guest{/if} {if $oTopic->getVote()} voted {if $oTopic->getVote()->getDirection()>0}plus{elseif $oTopic->getVote()->getDirection()<0}minus{/if}{/if}" style="{if $oUserCurrent and $oUserCurrent->getId()!=$oTopic->getBlog()->getOwnerId() and $oTopic->getBlog()->getType()=='personal'}margin-top:0px{/if}">
    		<a href="#" class="plus" onclick="return ls.vote.vote({$oTopic->getBlog()->getId()},this,1,'blog');"></a>
    		<div id="vote_total_blog_{$oBlog->getId()}" class="total" title="{$aLang.blog_vote_count}: {$oTopic->getBlog()->getCountVote()}">{$oTopic->getBlog()->getRating()}</div>
    		<a href="#" class="minus" onclick="return ls.vote.vote({$oTopic->getBlog()->getId()},this,-1,'blog');"></a>
    	</div>

        {if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId() and $oTopic->getBlog()->getType()!='personal'}
            <div onclick="ls.blog.toggleJoin(this,{$oBlog->getId()}); return false;" class="join {if $oBlog->getUserIsJoin()}active{/if}"></div>
        {/if}
    </div>
    {/if}

</div>
{/if}