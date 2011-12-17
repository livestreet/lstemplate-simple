{if $aTags and count($aTags)}
<div class="tags">
	<h2>{$aLang.block_tags_h2}</h2>
	<ul class="cloud">
	{foreach from=$aTags item=oTag}
		<li><a class="w{$oTag->getSize()}" rel="tag" href="{router page='tag'}{$oTag->getText()|escape:'url'}/">{$oTag->getText()|escape:'html'}</a></li>
	{/foreach}
	</ul>
</div>
{/if}