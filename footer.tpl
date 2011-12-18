			{hook run='content_end'}
		    {if $sAction=='index'}</div>{/if}<!-- /content-inner -->
		</div><!-- /content -->

		{if !$noSidebar}
			{include file='sidebar.tpl'}
		{/if}

        {if $sAction=='index'}
			{insert name="block" block=simpleTags}
        {/if}

	</div><!-- /wrapper -->

    <div class="hFooter"></div>

</div><!-- /container -->

<div id="footer">
	<div class="footer-inner">
		{include file="footer.links.tpl"}

	    {hook run='footer_end'}
    </div>
</div>

{hook run='body_end'}
</body>
</html>