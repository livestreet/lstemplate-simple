
        <ul class="blog-list">
		    {foreach from=$aBlogs item=oBlog name="cmt"}
		        <li {if $smarty.foreach.cmt.iteration == 1}style="border-top:0px; padding-top:0px"{/if}>
                    <a href="{router page='blog'}{$oBlog->getUrl()}/"><img src="{$oBlog->getAvatarPath(48)}" alt="avatar" class="avatar" title="{$oBlog->getTitle()|escape:'html'}" /></a>
                    <div class="infa"><a href="{router page='blog'}{$oBlog->getUrl()}/">{$oBlog->getTitle()|escape:'html'}</a></div>
                    <span>{$oBlog->getRating()}</span>
                </li>
		    {/foreach}
        </ul>