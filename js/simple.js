
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