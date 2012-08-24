<section class="block block-type-stream">
	{hook run='block_stream_nav_item' assign="sItemsHook"}

	<header class="block-header sep">
		<h3><a href="{router page='comments'}" title="{$aLang.block_stream_comments_all}">{$aLang.block_stream}</a></h3>
		<div class="block-update js-block-stream-update"></div>
		
		<ul class="nav nav-pills js-block-stream-nav">
			<li class="active js-block-stream-item" data-type="comment"><a href="#">{$aLang.block_stream_comments}</a></li>
			<li class="js-block-stream-item" data-type="topic"><a href="#">{$aLang.block_stream_topics}</a></li>
			{$sItemsHook}
		</ul>
	</header>
	
	<div class="block-content">
		<div class="js-block-stream-content">
			{$sStreamComments}
		</div>
	</div>
</section>

