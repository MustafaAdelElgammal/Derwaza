    /*----------------------------------------------------*/
    /*  Menu scroll js
    /*----------------------------------------------------*/
    var nav_offset_top = $('.main_menu_area').offset().top + 100;
    function stickyHeader() {
		if ($('.main_menu_area').length) {
			var strickyScrollPos = nav_offset_top;
			if($(window).scrollTop() > strickyScrollPos) {
				$('.main_menu_area').removeClass('fadeIn animated');
				$('.main_menu_area').addClass('stricky-fixed fadeInDown animated')
			}
			else if($(window).scrollTop() <= strickyScrollPos) {
				$('.main_menu_area').removeClass('stricky-fixed fadeInDown animated');
				$('.main_menu_area').addClass('slideIn animated')
			}
		}
	}
    
    // instance of fuction while Window Scroll event
	$(window).on('scroll', function () {	
		stickyHeader()
	})