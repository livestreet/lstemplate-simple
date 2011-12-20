<div class="block blogs" id="block_blogs">
	<h2>{$aLang.block_blogs}</h2>

	<ul class="switcher">
		<li id="block_blogs_item_top" class="active"><span>{$aLang.block_blogs_top}</span></li>
		{if $oUserCurrent}
			<li id="block_blogs_item_join"><span>{$aLang.block_blogs_join}</span></li>
			<li id="block_blogs_item_self"><span>{$aLang.block_blogs_self}</span></li>
		{/if}
	</ul>

	<div class="block-content" id="block_blogs_content">
		{$sBlogsTop}
	</div>

    <div class="bottom">
        <a href="{router page='blogs'}">{$aLang.all_blogs}</a>
    </div>
</div>
