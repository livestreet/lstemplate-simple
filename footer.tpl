			{hook run='content_end'}
		</div> <!-- /content -->

		{if !$noSidebar}
			{include file='sidebar.tpl'}
		{/if}

        {if $sAction=='index'}{include file='block.tags.tpl'}{/if}
	</div> <!-- /wrapper -->

    <div class="hFooter"></div>

</div> <!-- /container -->

<div id="footer">
	<div class="footer-inner">
		{include file="footer.links.tpl"}

	    {hook run='footer_end'}
    </div>
</div>

{include file='toolbar.tpl'}

{hook run='body_end'}

</body>
</html>