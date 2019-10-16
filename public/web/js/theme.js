;(function($) {
    "use strict";
    
    
    /*----------------------------------------------------*/
    /*  Home Slider js
    /*----------------------------------------------------*/
    function home_slider(){
        if ( $('#home-slider').length ){
            $("#home-slider").revolution({
                sliderType:"fullscreen",
                sliderLayout:"auto",
                delay:9000,
                disableProgressBar:"on",
                navigation: {
                    onHoverStop: 'off',
                    touch:{
                        touchenabled:"on"
                    },
                    arrows: {
                        style: "Gyges",
                        enable: true,
                        hide_onmobile: false,
                        hide_onleave: false,
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 17,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 17,
                            v_offset: 0
                        }
                    },
                },			
                responsiveLevels:[4096,1200,992,768,480],
                gridwidth:[1140,970,750,450,290],
                gridheight:[1000,900,750,480,480],
                lazyType:"none",
                parallax: {
                    type:"mouse",
                    origo:"slidercenter",
                    speed:2000,
                    levels:[2,3,4,5,6,7,12,16,10,50],
                },
            })
        }
    }
    home_slider();
    
    /*----------------------------------------------------*/
    /*  Home Slider js
    /*----------------------------------------------------*/
    function home_slider2(){
        if ( $('#home-slider2').length ){
            $("#home-slider2").revolution({
                sliderType:"fullscreen",
                sliderLayout:"auto",
                delay:9000,
                disableProgressBar:"on",
                navigation: {
                    onHoverStop: 'off',
                    touch:{
                        touchenabled:"on"
                    },
                    arrows: {
                        style: "Gyges",
                        enable: false,
                        hide_onmobile: false,
                        hide_onleave: false,
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 17,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 17,
                            v_offset: 0
                        }
                    },
                },			
                responsiveLevels:[4096,1200,992,768,480],
                gridwidth:[1140,940,720,700,290],
                gridheight:[794,794,700,500,480],
                lazyType:"none",
                parallax: {
                    type:"mouse",
                    origo:"slidercenter",
                    speed:2000,
                    levels:[2,3,4,5,6,7,12,16,10,50],
                },
            })
        }
    }
    home_slider2();
    
    
    /*----------------------------------------------------*/
    /*  Testimonial Slider
    /*----------------------------------------------------*/
    function testimonail_slider(){
        if ( $('.testimonail_slider').length ){
            $('.testimonail_slider').owlCarousel({
                loop:true,
                margin:0,
                items: 1,
                nav:false,
                autoplay: true,
                smartSpeed: 1500,
            })
        }
    }
    testimonail_slider();
    
    /*----------------------------------------------------*/
    /*  Testimonial Slider2
    /*----------------------------------------------------*/
    function testimonials_slider2(){
        if ( $('.testimonials_slider_active').length ){
            $('.testimonials_slider_active').owlCarousel({
                loop:true,
                margin:0,
                items: 1,
                nav:true,
                autoplay: true,
                smartSpeed: 1500,
                navText: ['<i class="lnr lnr-arrow-left"></i>','<i class="lnr lnr-arrow-right"></i>']
            })
        }
    }
    testimonials_slider2();
    
    $(".skill_item").each(function() {
        $(this).waypoint(function() {
            var progressBar = $(".progress-bar");
            progressBar.each(function(indx){
                $(this).css("width", $(this).attr("aria-valuenow") + "%")
            })
        }, {
            triggerOnce: true,
            offset: 'bottom-in-view'

        });
    });
    
    /*----------------------------------------------------*/
    /*  Counter up js
    /*----------------------------------------------------*/
    function counterup(){
        if ( $('.counter').length ){
            $('.counter').counterUp({
                delay: 20,
                time: 1000
            });
        }
    }
    counterup();
    
    $(".l_content").height($(".l_image").height());
    
    
//    $('.timer_inner time').countDown();
    
    $('.clock').countdown('2017/10/12', function(event) {
      var $this = $(this).html(event.strftime(
        '<div class="clock_item"><span>%d</span> Days </div>'
        + '<div class="clock_item"><span>%H</span> Hour </div>'
        + '<div class="clock_item"><span>%M</span> Min </div>'
        + '<div class="clock_item"><span>%S</span> Sec </div>'));
    });
    
//    $('#clock').countdown("2017/4/10", function(event) {
//      var totalHours = event.offset.totalDays * 24 + event.offset.hours;
//      $(this).html(event.strftime(totalHours + '%D Day %H Hour %M Min %S Sec'));
//    });
    
    
    
    /*----------------------------------------------------*/
    /*  Google map js
    /*----------------------------------------------------*/
    
    if ( $('#mapBox').length ){
        var $lat = $('#mapBox').data('lat');
        var $lon = $('#mapBox').data('lon');
        var $zoom = $('#mapBox').data('zoom');
        var $marker = $('#mapBox').data('marker');
        var $info = $('#mapBox').data('info');
        var $markerLat = $('#mapBox').data('mlat');
        var $markerLon = $('#mapBox').data('mlon');
        var map = new GMaps({
            el: '#mapBox',
            lat: $lat,
            lng: $lon,
            scrollwheel: false,
            scaleControl: true,
            streetViewControl: false,
            panControl: true,
            disableDoubleClickZoom: true,
            mapTypeControl: false,
            zoom: $zoom,
                styles: [
                 {"featureType":"water","elementType":"geometry","stylers":[{"color":"#e9e9e9"},{"lightness":17}]},          
                 {"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":20}]},
                 {"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ffffff"},{"lightness":17}]},
                 {"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#ffffff"},{"lightness":29},{"weight":0.2}]},
                 {"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":18}]},
                 {"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},
                 {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":21}]},
                 {"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#333333"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},
                 {"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},
                 {"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},
                 {"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]}
                ]
            });
        
            map.addMarker({
                lat: $markerLat,
                lng: $markerLon,
                icon: $marker,    
                infoWindow: {
                  content: $info
                }
            })
        }
    
    
    // preloader js
    $(window).load(function() { // makes sure the whole site is loaded
		$('#preloader_spinner').fadeOut(); // will first fade out the loading animation
		$('#preloader').delay(150).fadeOut('slow'); // will fade out the white DIV that covers the website.
		$('body').delay(150).css({'overflow':'visible'})
    })
    
})(jQuery)