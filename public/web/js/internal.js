$(function () {
    "use strict";
    $('.lazy').Lazy({
        scrollDirection: 'vertical',
        effect: 'fadeIn',
        visibleOnly: false
    });
    $(window).on('load', function (e) {$('.loader').fadeOut("slow");});
    /*Banner Slider Script Code Start*/
    $('.slideshow').owlCarousel({
        items: 1,
        autoplay: 5000,
        singleItem: true,
        navigation: false,
        pagination: false,
        loop: true
    });
    /*About Script Code Start*/
    $('.owl-about').owlCarousel({
        autoplay: true,
        autoplayTimeout: 3000,
        items: 1,
        loop: true,
        navigation: false,
        pagination: false
    });
    /*Popular Dishes Script Code Start */
    $('.dish').owlCarousel({
        margin: 20,
        autoplay: true,
        autoplayTimeout: 3000,
        items: 3,
        navigation: false,
        loop: true,
        lazyLoad:true,
        pagination: false,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            }
        }
    });
    /* Sticky header Start */
    $(window).on('scroll', function (e) {
        if ($(window).width() > 767) {
            if ($(window).scrollTop() >= 30) {
                $('.header-2 header').addClass('fixed-header');
            } else {
                $('.header-2 header').removeClass('fixed-header');
            }
        }
    });
    /* Product Grid Start */
    $('#grid-view').on('click',function(){
        $('.mainpage .row > .product-list').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-12');
        localStorage.setItem('display', 'grid');
    });
    $('#list-view').on('click',function(){
        $('.mainpage .row > .product-grid').attr('class', 'product-layout product-list col-12');
        localStorage.setItem('display', 'list');
    });

    loadScroller();
    initReservationForm();
    cartBoxToggle();
    addTOCart();
    manageCartControllers();
    changeCategory();
});
function loadScroller() {
    $('body').prepend('<a href="#" class="bottom-top"><i class="icofont icofont-bubble-up"></i></a>');
    var amountScrolled = 300;
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > amountScrolled) {
            $('a.bottom-top').fadeIn('slow');
        } else {
            $('a.bottom-top').fadeOut('slow');
        }
    });
    $('a.bottom-top').on('click', function () {
        $('html, body').animate({
            scrollTop: 0
        }, 700);
        return false;
    });
}
function initReservationForm() {
    var $reservationForm = $('.reservation-form');
    //validation rules
    var validator = $reservationForm.validate({
        rules: {
            name: {
                required: true,
                maxlength: 256,
                minlength: 2
            },
            email: {
                required: true,
                minlength: 3,
                maxlength: 100,
                email: true
            },
            mobile: {
                required: true,
                maxlength: 12,
                minlength: 10
            },
            date: {
                required: true,
                date: true
            }
        }
    });
    // Set up an event listener for the contact form.
    $reservationForm.on('submit', function (e) {
        // Stop the browser from submitting the form.
        e.preventDefault();
        // Serialize the form data.
        var formData = $reservationForm.serialize();
        // Submit the form using AJAX.
        $.ajax({
            type: 'POST',
            url: $reservationForm.attr('action'),
            data: formData
        })
                .done(function (response) {
                    // Set the message text.
                    $('#emailSend').show();
                    // Clear the form.
                    $('#input-name').val('');
                    $('#input-email').val('');
                    $('#input-mobile').val('');
                    $('#input-date').val('');
                    $('#input-time').val('');
                    $('#input-persons').val('');
                    setTimeout(function () {
                        $('#emailSend').hide();
                    }, 3000);
                })
                .fail(function (data) {
                    // Set the message text.
                    $('#emailError').show();
                    setTimeout(function () {
                        $('#emailError').hide();
                    }, 3000);
                });
    });
}
//--------------------------------------------------------------------
function startAjax() {
    NProgress.start();
    NProgress.set(0.3);
}
function endAjaxMenu() {
    NProgress.done();
    $("html, body").animate({
        scrollTop: $(".mainpage").eq(0).offset().top - 40
    }, "slow")
}
function endAjax() {
    NProgress.done()
}
function loadMoreAjax() {
    $(document).on('click', '.load-more-ajax', function(e) {
        e.preventDefault();
        var obj = $(this);
        var parent = obj.parents('.menu-listing-wrap').eq(0);
        $.ajax({
            url: obj.attr('href'),
            beforeSend: function(xhr) {
                startAjax();
                obj.html('<i class="fa fa-cog fa-spin"></i>');
                obj.addClass('disabled');
                startAjax();
            },
            success: function(data) {
                obj.remove();
                parent.append(data.html);
                $('.lazy').Lazy();
                // endAjaxMenu()
                NProgress.done()
            },
            error: function(xhr) {
                if (xhr.statusText === "Unauthorized") {
                    window.location.replace('http://' + window.location.hostname);
                }
            }
        })
    });
}
function postByAjax(formTarget, beforeSubmit, onSuccess, onError) {
    $(formTarget).submit(function(e) {
        e.preventDefault()
        var form = formTarget
        var parent = form.parents('.form-parent').eq(0)
        $.ajax({
            type: 'post',
            url: form.attr('action'),
            data: new FormData(form[0]),
            dataType: 'json',
            timeout: 100000,
            cache: false,
            contentType: false,
            processData: false,
            dataNew: { parent: parent, form: form },
            beforeSend: beforeSubmit,
            success: onSuccess,
            error: onError
        })
    })
}

function cartBoxToggle() {
    var trigger = $('.minicart-trigger'),
        container = $('.cartbox-wrap');
    $('<div class="body-overlay"></div>').prependTo(container);

    trigger.on('click', function(e) {
        e.preventDefault();
        container.toggleClass('is-visible');
    })
    $('.cartbox-close').on('click', function() {
        container.removeClass('is-visible');
    })
    container.find('.body-overlay').on('click', function() {
        container.removeClass('is-visible');
    })
}
function addTOCart() {
    $(document).on('click', '.add-to-cart', function(e) {
        e.preventDefault();
        var obj = $(this);
        var btn = $('#cart-button span');
        $.ajax({
            url: obj.attr('href'),
            beforeSend: function(xhr) {
                startAjax();
                obj.addClass('disabled');
            },
            success: function(data) {
                btn.text(parseInt(btn.text()) + 1);
                obj.removeClass('disabled');
                $('#cartbox_inner').html(data.cart)
                endAjax()
            },
            error: function(xhr) {endAjax()}
        })
    })
}
function manageCartControllers() {
    $(document).on('click', '.cart-controllers', function(e) {
        e.preventDefault();
        var el = $(this);
        ajaxCartController(el);
    })
}
function ajaxCartController(el) {
    var btn = $('#cart-button').find('span').eq(0);
    $.ajax({
        type: 'get',
        url: el.attr('href'),
        dataType: 'json',
        timeout: 6000,
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function(xhr) {
            // startAjax()
        },
        success: function(data) {
            $('#cartbox_inner').html(data.cart);
            const cartPageParent = $('#cart-page-parent');
            if(cartPageParent.length) cartPageParent.html(data.cart_page);
            btn.text(data.count)
            // endAjax()
        },
        error: function(xhr) {
            // endAjax();
        }
    })

}

function changeCategory() {

    var allCat = $('.menu-category');
    if (allCat.length) {
        setRang();
        lang = document.lang;
        menuLink = document.menuLink;
        parent = $('.menu-listing-wrap');
        oldMin = $('#min-rang').val();
        oldMax = $('#max-rang').val();

        $(document).on('click', '.menu-category', function(e) {
            e.preventDefault();
            startAjax();
            var obj = $(this);
            var parent = $('.menu-listing-wrap');
            var sliderRange = $('#slider-range');
            $.getJSON(obj.attr('href'), {format: "json"},
                function(data) {
                    menuLink = obj.attr('href');
                    allCat.removeClass('active');
                    obj.addClass('active');
                    parent.html(data.html);
                    $('.lazy').Lazy();
                    /** @namespace data.dishes_rang.min_price */
                    /** @namespace data.dishes_rang */
                    sliderRange.slider("option", "min", data.dishes_rang.min_price);
                    /** @namespace data.dishes_rang.max_price */
                    sliderRange.slider("option", "max", data.dishes_rang.max_price);
                    oldMin = data.dishes_rang.min_price;
                    oldMax = data.dishes_rang.max_price;
                    sliderRange.slider("option", "values", [data.dishes_rang.min_price, data.dishes_rang.max_price]);
                    $("#amount").val(+sliderRange.slider("values", 0) + " - " + sliderRange.slider("values", 1));
                    endAjaxMenu()
                }
            );
        });

        loadMoreAjax();
    }
}


function setRang() {
    //range slider
    var sliderRange = $('#slider-range');

    sliderRange.slider({
        min: parseFloat($('#min-rang').val()),
        max: parseFloat($('#max-rang').val()),
        values: [parseFloat($('#min-rang').val()), parseFloat($('#max-rang').val())],
        step: 0.05,
        isRTL: true,
        range: true,
        slide: function(event, ui) {
            $("#amount").val(ui.values[0].toFixed(2) + " - " + ui.values[1].toFixed(2));
        },
        stop: function(event, ui) {
            oldMin = ui.values[0];
            oldMax = ui.values[1];
            setTimeout(function() {
                if (oldMin == ui.values[0] && oldMax == ui.values[1]) {
                    startAjax();
                    $("#slider-range").css('opacity', .3);
                    $.getJSON(menuLink + '?min=' + oldMin + '&max=' + oldMax, {format: "json"},
                        function(data) {
                            parent.html(data.html);
                            $('.lazy').Lazy();
                            $("#slider-range").css('opacity', 1);
                            endAjaxMenu();
                        }
                    );
                }

            }, 900);
        }
    });

    $("#amount").val(+$("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1));
}