
<div class="user-profile-comments">

	<div class="zagolovok">
		<h2>{$aLang.comments_h2}</h2>
		<a href="{router page='my'}{$oUserProfile->getLogin()}/comment/">{$aLang.all_comments}</a>
	</div>


	<div class="comments" style="margin-left:0">

		<div class="comment">
            <div class="avatar"><a href="#" title="#"><img src="{cfg name='path.static.skin'}/images/foto.png" alt="avatar"></a></div>
            <div class="border-comment">
            	<div class="content">
                    <div class="arrow"></div>
                    <div class="padding">

                        <ul class="info">
                		    <li class="username"><a href="#">Admincheg</a></li>
                		    <li class="date">16.06.12</li>
                    	    <li><a href="#" class="reply-link">{$aLang.go_to_comment}</a></li>
                		</ul>

                        <div class="text-style">Some text. Bla bla bla....</div>
                    </div>
            	</div>
            </div>
        </div>

		<div class="comment">
            <div class="avatar"><a href="#" title="#"><img src="{cfg name='path.static.skin'}/images/foto.png" alt="avatar"></a></div>
            <div class="border-comment">
            	<div class="content">
                    <div class="arrow"></div>
                    <div class="padding">

                        <ul class="info">
                		    <li class="username"><a href="#">Ne admincheg</a></li>
                		    <li class="date">16.06.12</li>
                    	    <li><a href="#" class="reply-link">{$aLang.go_to_comment}</a></li>
                		</ul>

                        <div class="text-style">Some text. Bla bla bla....</div>
                    </div>
            	</div>
            </div>
        </div>
</div>

</div>       