<div class="block blogs" id="block_blogs">
	<h2>{$aLang.block_blogs}</h2>

	<ul class="switcher2">
		<li id="block_blogs_item_top" class="active first">{$aLang.block_blogs_top}</li>
		{if $oUserCurrent}
			<li id="block_blogs_item_join">{$aLang.block_blogs_join}</li>
			<li id="block_blogs_item_self" class="last">{$aLang.block_blogs_self}</li>
		{/if}
	</ul>

	<div class="block-content" id="block_blogs_content">
		{$sBlogsTop}
	</div>
</div>
