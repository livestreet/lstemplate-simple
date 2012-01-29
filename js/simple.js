/*-------------------------------------------------------
 *
 *   LiveStreet Engine Social Networking
 *   Copyright © 2008 Mzhelskiy Maxim
 *
 *--------------------------------------------------------
 *
 *   Official site: www.livestreet.ru
 *   Contact e-mail: rus.engine@gmail.com
 *
 *   GNU General Public License, version 2:
 *   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 ---------------------------------------------------------
 */


var ls = ls || {};
ls.plugin = ls.plugin || {};

/**
 * Динамическая подгрузка блоков
 */
ls.plugin.simpletpl = (function ($) {

	this.options = {

	};

	this.iPageCurr=1;
	this.iCountPage=3;

	this.init = function(iCountPage){
		this.iCountPage=iCountPage;
	};

	this.page = function(iPage) {
		var margin=744*(iPage-1);
		//$('#slider-hidden').css({'margin-left':'-'+margin+'px'});

		$('#slider-hidden').animate({
			'margin-left':'-'+margin+'px'
		});

		$('#simple-topictop-nav-page-'+this.iPageCurr).removeClass('active');
		$('#simple-topictop-nav-page-'+iPage).addClass('active');
		this.iPageCurr=iPage;
		return false;
	}

	this.next = function() {
		var iPageNext=this.iPageCurr+1;
		if (iPageNext>this.iCountPage) {
			iPageNext=this.iCountPage;
		}
		this.page(iPageNext);
		return false;
	}

	this.prev = function() {
		var iPageNext=this.iPageCurr-1;
		if (iPageNext<1) {
			iPageNext=1;
		}
		this.page(iPageNext);
		return false;
	}

	this.initUserBar = function() {
		$(".signin").click(function(e) {
			e.preventDefault();
			$("ul#signin_menu").toggle();
			$(".signin").toggleClass("menu-open");
		});

		$("ul#signin_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if($(e.target).parent(".signin").length==0) {
				$(".signin").removeClass("menu-open");
				$("ul#signin_menu").hide();
			}
		});
	}

	return this;
}).call(ls.plugin.simpletpl || {},jQuery);



/**************
 * MAIN
 */

jQuery(document).ready(function($){
	// Хук начала инициализации javascript-составляющих шаблона
	ls.hook.run('ls_template_init_start',[],window);
	 
	// Всплывающие окна
	$('#login_form').jqm({trigger: '#login_form_show'});
	$('#blog_delete_form').jqm({trigger: '#blog_delete_show'});
	$('#add_friend_form').jqm({trigger: '#add_friend_show'});
	$('#form_upload_img').jqm();
	$('#userfield_form').jqm();
	
	// Datepicker
	$('.date-picker').datepicker({ 
		dateFormat: 'dd.mm.yy',
		dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
		monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
		firstDay: 1
	});
	
	
	// Поиск по тегам
	$('#tag_search_form').submit(function(){
		window.location = aRouter['tag']+$('#tag_search').val()+'/';
		return false;
	});
	
	
	// Автокомплит
	ls.autocomplete.add($(".autocomplete-tags-sep"), aRouter['ajax']+'autocompleter/tag/', true);
	ls.autocomplete.add($(".autocomplete-users"), aRouter['ajax']+'autocompleter/user/', true);
	ls.autocomplete.add($(".autocomplete-city"), aRouter['ajax']+'autocompleter/city/', false);
	ls.autocomplete.add($(".autocomplete-country"), aRouter['ajax']+'autocompleter/country/', false);

	
	// Скролл
	$(window)._scrollable();
	
	
	// Show blog info
	$("#show_blog_info").click(function(){
		$("#blog_info").slideToggle(500);
		$("#show_blog_info").toggleClass("inactive");
		return false;
	});
	
	
	// Detecting IE6-IE8
	if ($.browser.msie && $.browser.version.substr(0,1) <= 8) { 
		$(".switcher li:first-child").addClass("first-child");
		$(".switcher li:last-child").addClass("last-child");
	}
	
	// Хук конца инициализации javascript-составляющих шаблона
	ls.hook.run('ls_template_init_end',[],window);	
});



/**************
 * BLOCKS
 */

/**
* Подключаем действующие блоки
*/
jQuery(function($){
	$('[id^="block_stream_item"]').click(function(){
		ls.blocks.load(this, 'block_stream');
		return false;
	});

	$('[id^="block_blogs_item"]').click(function(){
		ls.blocks.load(this, 'block_blogs');
		return false;
	});
});


/*****************
 * BLOG
 */

ls.hook.add('ls_blog_toggle_join_after', function(idBlog,result){
	if(result.bState){
		this.addClass("active");
	}else{
		this.removeClass("active");
	}
});



/*****************
 * COMMENTS
 */

jQuery(document).ready(function(){
	ls.comments.init();
});



/*****************
 * TALK
 */

jQuery(document).ready(function($){
	// Добавляем или удаляем друга из списка получателей
	$('#friends input:checkbox').change(function(){
		ls.talk.toggleRecipient($('#'+$(this).attr('id')+'_label').text(), $(this).attr('checked'));
	});
	
	// Добавляем всех друзей в список получателей
	$('#friend_check_all').click(function(){
		$('#friends input:checkbox').each(function(index, item){
			ls.talk.toggleRecipient($('#'+$(item).attr('id')+'_label').text(), true);
			$(item).attr('checked', true);
		});
		return false;
	});
	
	// Удаляем всех друзей из списка получателей
	$('#friend_uncheck_all').click(function(){
		$('#friends input:checkbox').each(function(index, item){
			ls.talk.toggleRecipient($('#'+$(item).attr('id')+'_label').text(), false);
			$(item).attr('checked', false);
		});
		return false;
	});
	
	// Удаляем пользователя из черного списка
	$("#black_list_block").delegate("a.delete", "click", function(){
		ls.talk.removeFromBlackList(this);
		return false;
	});
	
	// Удаляем пользователя из переписки
	$("#speaker_list_block").delegate("a.delete", "click", function(){
		ls.talk.removeFromTalk(this, $('#talk_id').val());
		return false;
	});
});

