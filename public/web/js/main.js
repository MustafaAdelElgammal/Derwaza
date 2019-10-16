$(function() {
    "use strict";

    checkHandle();



    onSpanClick();
    var allCat = $('.menu-category');
    if (allCat.length) {
        var lang = document.lang
        var menuLink = document.menuLink
        var parent = $('.menu-listing-wrap')
        var tagParent = $('#tags-parent')
        var oldMin = $('#min-rang').val()
        var oldMax = $('#max-rang').val()

        $(document).on('click', '.menu-category', function(e) {
            e.preventDefault();
            startAjax()
            var obj = $(this);
            var parent = $('.menu-listing-wrap');
            var tagParent = $('#tags-parent')
            $.getJSON(obj.attr('href'), {
                    format: "json"
                },
                function(data) {
                    menuLink = obj.attr('href')
                    allCat.removeClass('active')
                    obj.addClass('active')
                    parent.html(data.html)
                    /** @namespace data.dishes_rang.min_price */
                    /** @namespace data.dishes_rang */
                    $('#slider-range').slider("option", "min", data.dishes_rang.min_price);
                    /** @namespace data.dishes_rang.max_price */
                    $('#slider-range').slider("option", "max", data.dishes_rang.max_price);
                    oldMin = data.dishes_rang.min_price
                    oldMax = data.dishes_rang.max_price
                    $('#slider-range').slider("option", "values", [data.dishes_rang.min_price, data.dishes_rang.max_price]);
                    $("#amount").val(+$("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1));

                    tagParent.html(" ")
                    endAjaxMenu()
                }
            );
        })
        setRang()
        loadMoreAjax()
    }
    function setRang() {
        //range slider
        $("#slider-range").slider({
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
                oldMin = ui.values[0]
                oldMax = ui.values[1]
                setTimeout(function() {
                    if (oldMin == ui.values[0] && oldMax == ui.values[1]) {
                        startAjax()
                        $("#slider-range").css('opacity', .3)
                        $.getJSON(menuLink + '&min=' + oldMin + '&max=' + oldMax, {
                                format: "json"
                            },
                            function(data) {
                                parent.html(data.html)
                                tagParent.html("")
                                $("#slider-range").css('opacity', 1)
                                endAjaxMenu()
                            }
                        );
                    }

                }, 900);
            }
        });

        $("#amount").val(+$("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1));
    }
    function loadMoreAjax() {
        $(document).on('click', '.load-more-ajax', function(e) {
            e.preventDefault();
            var obj = $(this);
            var parent = obj.parents('.menu-listing-wrap').eq(0);
            $.ajax({
                url: obj.attr('href'),
                beforeSend: function(xhr) {
                    startAjax()
                    obj.html('<i class="fa fa-cog fa-spin"></i>');
                    obj.addClass('disabled');
                },
                success: function(data) {
                    obj.remove();
                    parent.append(data.html);
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

    function startAjax() {
        NProgress.start()
        NProgress.set(0.3)
        NProgress.inc(0.4)
    }
    function endAjaxMenu() {
        NProgress.done()
        $("html, body").animate({
            scrollTop: $(".menu-page-block").eq(0).offset().top - 40
        }, "slow")
    }
    function endAjax() {
        NProgress.done()
    }
    function initFormSend(elements){
        var btn = elements.find(".submit-btn")
        btn.addClass('disabled')
        btn.find('i').eq(0).addClass('fa-spin')
        elements.find('.help-block').text("")
    }
    function initFormBack(elements){
        var btn = elements.find(".submit-btn")
        btn.removeClass('disabled')
        btn.find('i').eq(0).removeClass('fa-spin')
    }

    /*============= MyAccount Toggle ==============*/
    function myAccountToggle() {
        var trigger = $('.myaccount-trigger'),
            container = $('.myaccount-wrap');
        $('<div class="body-overlay"></div>').prependTo(container);
        trigger.on('click', function(e) {
            e.preventDefault();
            container.toggleClass('is-visible');
        })
        $('.myaccount-close').on('click', function() {
            container.removeClass('is-visible');
        })
        container.find('.body-overlay').on('click', function() {
            container.removeClass('is-visible');
        })
    };
    myAccountToggle();



    $(document).on('click', '.cart-contollers', function(e) {
        e.preventDefault();
        var el = $(this);
        ajaxCartController(el);
    })
    function ajaxCartController(el) {
        var btn = $('#cart-button span');
        $.ajax({
            type: 'get',
            url: el.attr('href'),
            dataType: 'json',
            timeout: 6000,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function(xhr) {
                startAjax()
            },
            success: function(data) {
                $('#cartbox_inner').html(data.cart)
                if($('#cart-page-parent').length){
                    $('#cart-page-parent').html(data.cart_page)
                }
                btn.text(data.count)
                endAjax()
            },
            error: function(xhr) {endAjax()}
        })

    }


    function onPlaceOrderSubmit(){
        var form = $('.form-place-order')
        initFormSend(form)
        startAjax()
        var $validator = form.validate({
            errorElement: 'span',
            errorClass: 'help-block',
            rules: {
                "terms" : {required: true},
            },
            errorPlacement: function (error, element) {
                error.insertAfter($('.check-parent-label'));
            },
            highlight: function (element) {
                $(element).closest('fieldset').removeClass('has-success').addClass('has-error')
            },
            success: function (element) {$("#checkBoxErrorHolder").html();}
        })
        if (!form.valid()) {
            $validator.focusInvalid()
            endAjax()
            return false
        }
        $('.proceed-to-checkout .btn, .proceed-to-checkout').addClass('disabled');
        // window.location.href = 'https://healthybarkw.com/program-complete';
        return true
    }
    function onPlaceOrderError(xhr) {
        var form = $('.form-place-order')
        var data = JSON.parse(xhr.responseText)
        var dataArray = [this.dataNew.parent]
        endAjax()
        $('.proceed-to-checkout .btn, .proceed-to-checkout').removeClass('disabled');
        initFormBack(form)
        if (data.validator != null) {
            $.each(data.validator, function (key, value) {
                var inp = dataArray[0].find("#address-view-parent")
                inp.find('.help-block').eq(0).text(data.message)
                inp.find('.review-info').eq(0).addClass('has-error')
            })
            $("html, body").animate({
                scrollTop: $(".form-place-order").eq(0).offset().top - 100
            }, "fast")
        }
    }
    function onPlaceOrderSuccess(data, textStatus, xhr) {
        endAjax()
        window.location.href = data.url
    }
    function onSpanClick() {
        $(document).on('click', '.span-of-dish', function(e) {

            var item = $(this);

            var parent = item.parents('.food-listing-row').eq(0);
            parent.find('.span-of-dish.selected').removeClass('selected');
            item.addClass('selected');

            parent.find('.dish-detail').css('display','none');
            parent.find('#detail-'+item.attr('id')).css('display','inherit');
            parent.find('#detail-'+item.attr('id') + ' .chosen-select').trigger("chosen:updated");

            parent
                .find('.checkBoxChildSides')
                .prop('checked', false);

            parent.find('#detail-'+item.attr('id'))
                .find('.checkBoxChildSides')
                .eq(0)
                .prop('checked', true);

            parent.find('.image-dish').css('display','none');
            parent.find('#image-'+item.attr('id')).css('display','inherit');
        })
    }

    function checkHandle() {
        var elProgram = $(".select-program.program");
        if(elProgram.length){
            elProgram.on('change', function (e) {
                elProgram.val($(this).attr('value'));
                var label = $('.in-price');
                var offer = $('.offer_of_week');
                offer.hide();

                var planType = $('.plan_type').attr('value');
                var numOfWeeks = +this.value;
                if(planType === 'normal') {
                    var amount ;
                    var fourWeekPrice  = parseFloat(  $('.one-week-price').attr('value'));
                    var fourWeekPriceOffer = parseFloat( $('.four-week-price-offer').attr('value'));

                    if(+numOfWeeks === 4)
                        amount = fourWeekPrice;
                    else if(numOfWeeks < 4)
                        amount = ((fourWeekPrice/4) * numOfWeeks) + 10;
                    else if(numOfWeeks > 4)
                        amount = ((fourWeekPrice/4) * numOfWeeks);
                    label.text(Number(amount.toFixed(3)));

                    var optionSelected = $("option:selected", this);
                    if(!optionSelected.hasClass('none-price')){
                        amount = +optionSelected.attr("class");
                        $('.price-per-day-offer .p-color').text(Number(amount.toFixed(3)));
                        offer.show();
                    }

                }else if(planType === 'go'){
                    amount = $('.one-week-price').attr('value') * numOfWeeks;
                    label.text(Number(amount.toFixed(3)));
                    offer.hide();
                }
                $('.all_price').attr('value', Number(amount.toFixed(3)));
                $('.week_count').attr('value', numOfWeeks);
                $('#well-price strong').text( Number(amount.toFixed(3)));
            });
        }

        if($('input.checkBoxHidden').length)
            sumDished();

        $(".checkBoxChild").change(function() {
            var parent = $(this).parents('.food-type');
            parent.find('.checkBoxChild').prop('checked', false);
            $(this).prop('checked', true);
            var parentDirect = $(this).parent('.check-parent');
            parentDirect.find('.span-of-dish').trigger('click');

            if($('input.checkBoxHidden').length)
                sumDished();
        });
        checkHandleSides();

        if($('.days-list-btns-parent').length){
            $('.days-list-btns').on('click', function (e) {
                $('.days-list-btns-parent').removeClass('active');
                $('.tab-content .tab-pane').removeClass('active');

                var parent = $(this).parent('.days-list-btns-parent');

                $('.tab-pane#' + parent.find('a').attr('href').substring(1)).remove();
                parent.remove();

                $('.tab-pane').first().addClass('active');
                $('.tab-pane').first().addClass('in');

                $('.days-list-btns-parent').first().addClass('active');
                if($('.days-list-btns-parent').length == 3 )
                    $('.days-list-btns-parent .days-list-btns, .days-list-btns-parent label').remove();
                if($('input.checkBoxHidden').length)
                    sumDished();
            })
        }
        if($('.food-listing-row').length){
            $('.days-meals-btns').on('click', function (e) {
                $('.'+ $(this).attr('value') +'-get').remove();
                if($('.days-meals-btns').parents('.food-listing-group').eq(0).find('.days-meals-btns').length == 1 )
                    $('.days-meals-btns , .food-listing-row label.close-box').remove();
                if($('input.checkBoxHidden').length)
                    sumDished();
            })
        }
    }
    var mealsWeight = $(".meal-weight");
    if(mealsWeight.length){
        mealsWeight.on('change', function (e) {
            $('.' + $(this).attr('class').split(' ')[1]).val($(this).attr('value'));
            sumDished();
        });
    }
    function sumDished() {
        var t = $('.food-type input.checkBoxChild:checked');
        var planType = $('.plan_type').attr('value');
        var total = 0.000;
        t.each(function () {
            var parent = $(this).parent('.check-parent');
            var iPrice = parseFloat(parent.find('input.checkBoxHidden').attr('value'));
            if(planType === 'go'){
                var weight = parent.parents('.food-type').eq(0).find('.meal-weight').attr('value');
                total += (weight * iPrice) / 100;
            }else{
                total += iPrice;
            }
        });
        var weekPrice = total;
        total = (total * parseFloat($('.week_count').attr('value'))).toFixed(3);
        $('.one-week-price').attr('value', weekPrice);
        $('.in-price').text(Number(total));
        $('.all_price').attr('value', Number(total));
        $('#well-price strong').text(Number(total));
    }
    function checkHandleSides() {
        $(".checkBoxChildSides").change(function() {
            var parent = $(this).parents('.food-type');
            parent.find('.checkBoxChildSides').prop('checked', false);
            $(this).prop('checked', true);
        });
    }

});

function validateStartPhone(evt) {
    if ((evt.code == 'ArrowLeft') || (evt.code == 'ArrowRight') || (evt.code == 'ArrowUp') || (evt.code == 'ArrowDown') || (evt.code == 'Delete') || (evt.code == 'Backspace')) {
        return
    }
    var theEvent = evt || window.event
    var key = theEvent.keyCode || theEvent.which
    key = String.fromCharCode( key )
    var regex = /[0-9]|\0/
    if( !regex.test(key) ) {
        theEvent.returnValue = false
        if(theEvent.preventDefault) theEvent.preventDefault()
    }
}
function validateNumber(evt) {
    if ((evt.code == 'ArrowLeft') || (evt.code == 'ArrowRight') || (evt.code == 'ArrowUp') || (evt.code == 'ArrowDown') || (evt.code == 'Delete') || (evt.code == 'Backspace')) {
        return
    }
    var theEvent = evt || window.event
    var key = theEvent.keyCode || theEvent.which
    key = String.fromCharCode( key )
    var regex = /[0-9]|\0/
    if( !regex.test(key) ) {
        theEvent.returnValue = false
        if(theEvent.preventDefault) theEvent.preventDefault()
    }
}
function validateWithoutZero(evt) {
    if ((evt.code == 'ArrowLeft') || (evt.code == 'ArrowRight') || (evt.code == 'ArrowUp') || (evt.code == 'ArrowDown') || (evt.code == 'Delete') || (evt.code == 'Backspace')) {
        return
    }
    var theEvent = evt || window.event
    var key = theEvent.keyCode || theEvent.which
    key = String.fromCharCode( key )
    var regex = /[0-9]|\./
    if( !regex.test(key) || (evt.target.value  == "" && key == 0)){
        theEvent.returnValue = false
        if(theEvent.preventDefault) theEvent.preventDefault()
    }
    evt.target.onkeyup = function (e){
        setTimeout(
            function(){
                if(parseFloat(e.target.value)  <= 0 || parseFloat(e.target.value) == 'NaN')
                    e.target.value  = null
            }, 1500
        )
    }
}