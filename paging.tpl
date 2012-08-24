{if $aPaging and $aPaging.iCountPage>1}
	<div class="pagination">
		<ul>
            <li class="side">
			{if $aPaging.iPrevPage}
				<a href="{$aPaging.sBaseUrl}/page{$aPaging.iPrevPage}/{$aPaging.sGetParams}">&larr; {$aLang.back}</a>
			{else}
				&larr; {$aLang.back}
			{/if}
            </li>
			{foreach from=$aPaging.aPagesLeft item=iPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$iPage}/{$aPaging.sGetParams}">{$iPage}</a></li>
			{/foreach}
			<li class="active">{$aPaging.iCurrentPage}</li>
			{foreach from=$aPaging.aPagesRight item=iPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$iPage}/{$aPaging.sGetParams}">{$iPage}</a></li>
			{/foreach}
            <li class="side">
            {if $aPaging.iNextPage}
				<a href="{$aPaging.sBaseUrl}/page{$aPaging.iNextPage}/{$aPaging.sGetParams}">{$aLang.forward} &rarr; </a>
			{else}
				{$aLang.forward} &rarr;
			{/if}
            </li>
		</ul>
	</div>
{/if}