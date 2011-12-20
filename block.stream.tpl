<div class="block stream" id="block_stream">
	<h2>{$aLang.block_stream}</h2>
	<ul class="switcher">
		<li id="block_stream_item_comment" class="first active"><span>{$aLang.block_stream_comments}</span></li>
		<li id="block_stream_item_topic"><span>{$aLang.block_stream_posts}</span></li>
        
		{hook run='block_stream_nav_item'}
	</ul>
    
	<div class="block-content" id="block_stream_content">
		{$sStreamComments}
	</div>        
</div>

