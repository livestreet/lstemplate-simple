<section class="tags">
	<header class="block-header sep">
		<h3>{$aLang.block_tags_h2}</h3>
	</header>

	
	<div class="block-content">
		<div class="js-block-tags-content" data-type="all">
			{if $aTags}
				<ul class="tag-cloud word-wrap">
					{foreach from=$aTags item=oTag}
						<li><a class="tag-size-{$oTag->getSize()}" href="{router page='tag'}{$oTag->getText()|escape:'url'}/">{$oTag->getText()|escape:'html'}</a></li>
					{/foreach}
				</ul>
			{else}
				<div class="notice-empty">{$aLang.block_tags_empty}</div>
			{/if}
		</div>
	</div>
</section>