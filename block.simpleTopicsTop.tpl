
<script type="text/javascript">
	jQuery(document).ready(function($){
		ls.plugin.simpletpl.init({$simpletpl_iCountSlide});
	});
</script>
<div class="slider-nav">
	<h2 class="title-best">{$aLang.slider_title_best}</h2>

	<div class="switch">
		<ul>
			<li class="arrowleft"><a href="#" id="simple-topictop-nav-prev" onclick="return ls.plugin.simpletpl.prev();"></a></li>
			<li><a href="#" id="simple-topictop-nav-page-{$smarty.section.num_slide.index}" onclick="return ls.plugin.simpletpl.page({$smarty.section.num_slide.index});" {if $smarty.section.num_slide.first}class="active"{/if}></a></li>
            <li class="arrowright"><a href="#" id="simple-topictop-nav-next" onclick="return ls.plugin.simpletpl.next();"></a></li>
		</ul>
	</div>
</div>

<div id="slider">
	<div id="slider-hidden">
            <ul class="topics-short">

		        <div class="topic-slider">
        		<li class="topicshort news">
                    <div class="inform">
                		<h3 class="title">
                			<a href="#" class="title-topic" title="#">Super-puper dlinnii zagolovok</a>
                		</h3>

                		<div class="content">
                			Some text. lalalalalalala
                		</div>
                    </div>

                	<ul class="info">
                        <li class="avatar"><a href="#" title="#"><img src="{cfg name='path.static.skin'}/images/foto.png" alt="avatar"></a></li>
                		<li class="username">
                            <a href="#">admin</a><br />
                            today
                        </li>
                		<li class="comments-link">
                		    <a href="#">12</a>
                		</li>
                	</ul>
                </li>
                </div>
		        <div class="topic-slider">
        		<li class="topicshort news">
                    <div class="inform">
                		<h3 class="title">
                			<a href="#" class="title-topic" title="#">Super-puper dlinnii zagolovok</a>
                		</h3>

                		<div class="content">
                			Some text. lalalalalalala
                		</div>
                    </div>

                	<ul class="info">
                        <li class="avatar"><a href="#" title="#"><img src="{cfg name='path.static.skin'}/images/foto.png" alt="avatar"></a></li>
                		<li class="username">
                            <a href="#">admin</a><br />
                            today
                        </li>
                		<li class="comments-link">
                		    <a href="#">12</a>
                		</li>
                	</ul>
                </li>
                </div>
		        <div class="topic-slider">
        		<li class="topicshort news">
                    <div class="inform">
                		<h3 class="title">
                			<a href="#" class="title-topic" title="#">Super-puper dlinnii zagolovok</a>
                		</h3>

                		<div class="content">
                			Some text. lalalalalalala
                		</div>
                    </div>

                	<ul class="info">
                        <li class="avatar"><a href="#" title="#"><img src="{cfg name='path.static.skin'}/images/foto.png" alt="avatar"></a></li>
                		<li class="username">
                            <a href="#">admin</a><br />
                            today
                        </li>
                		<li class="comments-link">
                		    <a href="#">12</a>
                		</li>
                	</ul>
                </li>
                </div>
		        <div class="topic-slider">
        		<li class="topicshort news">
                    <div class="inform">
                		<h3 class="title">
                			<a href="#" class="title-topic" title="#">Super-puper dlinnii zagolovok</a>
                		</h3>

                		<div class="content">
                			Some text. lalalalalalala
                		</div>
                    </div>

                	<ul class="info">
                        <li class="avatar"><a href="#" title="#"><img src="{cfg name='path.static.skin'}/images/foto.png" alt="avatar"></a></li>
                		<li class="username">
                            <a href="#">admin</a><br />
                            today
                        </li>
                		<li class="comments-link">
                		    <a href="#">12</a>
                		</li>
                	</ul>
                </li>
                </div>
            </ul>   

	</div>
</div>