document.url = window.location.href;
_document = $(document);
$(window).load(function () {
    $('#status').fadeOut();
    $('#preloader').delay(250).fadeOut(function () {
        $('body').delay(250).css({'overflow': 'visible'});
    });
    setTimeout(function () {
        $(".chosen-select-meals").chosen({});
        $('.popovers').popover();
    }, 3500)
});
$(window).resize(function () {
    const body = $('body');
    if (body.css('position') === 'relative') {
        body.removeClass('leftpanel-collapsed chat-view');
    } else {
        body.removeClass('chat-relative-view');
        body.css({left: '', marginRight: ''});
    }
});
_document.ready(function () {
    window.history.replaceState({url: document.url, innerhtml: vars.contentInner.html()}, document.url, document.url);
    initJs();
});
const vars = {
    contentInner: $('#content-inner'),
    mainURL: location.protocol + '//' + location.host
};
/**********************************************************/
// noinspection JSUnresolvedFunction
_document.ajaxComplete(function (ev, jqXHR, settings) {
    try {
        $.parseJSON(jqXHR.responseText);
    } catch (e) {
        window.history.pushState({url: settings.url, innerhtml: jqXHR.responseText}, settings.url, settings.url);
    }
});
// noinspection JSUnusedLocalSymbols
_document.ajaxError(function (event, jqXHR, settings, exception) {
    if (jqXHR.statusText === "Unauthorized")
        window.location.replace('http://' + window.location.hostname + '/admin');
    fadeInSite();
});
window.onpopstate = function (event) {
    fadeOutSite();
    const currentState = event.state;
    if (currentState != null && !!currentState) {
        vars.contentInner.html($("#content-inner", currentState.innerhtml).html());
        document.url = currentState.url;
        fadeInSite();
        reloadedScripts();
    }
};

function reloadedScripts() {
    $.material.init();
    formWizard($('.form-wizard'));
    summerNoteDesc($(".desc"));
    summerNoteShort($('.short-area'));
    moduleJs();
    sortableItems();
    dropZoneGallery();
    socialItem('.add_field_button_social', '.input_fields_wrap_social', "#template_input_social");
    disabledItems();
    setInputsLength();

    if ($('form.submit-ajax').length > 0)
        postFormAjax('form.submit-ajax', mainBeforeSubmit, mainOnSuccessSubmit, mainOnErrorSubmit);

    createDishScript('form#submit-ajax-new-dish');
    $('#password-change-check').change(function () {
        if (this.checked) {
            $('#password-change-inputs').removeClass('hidden');
        } else {
            $('#password-change-inputs').addClass('hidden');
        }
    });

    const multiInsert = $('.multi-insert');
    if (multiInsert.length > 0) {
        const regex5 = /^\d{8}$/;// Number
        multiInsert.tagsInput({width: 'auto', defaultText: '',pattern: regex5});
        $(".tagsinput").keypress(NumbersOnly).attr('maxLength', 8);
        $(".tagsinput input").attr('maxLength', 8);

    }
    // noinspection JSCheckFunctionSignatures
    $('.fileinputremove').click(function () {
        $('input[type=file]').val(null)
    });
    $("select.chosen-select, select.chosen-select-meals").each(function () {
        $(this).find('option').first().attr("disabled", "disabled")
    });
    $('.tooltips').tooltip({
        container: $('.contentpanel')
    });
    $(".chosen-select").chosen({'placeholder_text_multiple': " "});
    $('.popovers').popover();
}

function initJs() {
    NProgress.configure({parent: '#progress', showSpinner: false});
    $.extend($.gritter.options, {
        //class_name: 'gritter-light', // for light notifications (can be added directly to $.gritter.add too)
        //position: 'bottom-left', // possibilities: bottom-left, bottom-right, top-left, top-right
        fade_in_speed: 100, // how fast notifications fade in (string or int)
        fade_out_speed: 100, // how fast the notices fade out
        time: 3500 // hang on the screen for...
    });
    filterDishesByCategory();
    reloadedScripts();
    loadLinkAjax();
    loadMoreAjax();
    deleteItem();
    $('#toggle-up').on("click", function (e) {
        e.preventDefault();
        history.back();
    });
    const contentInner = $('#content-inner');
    contentInner.on("click", '.minimize', function () {
        const t = $(this);
        const p = t.closest('.panel');
        if (!$(this).hasClass('maximize')) {
            p.find('.panel-body, .panel-footer').slideUp(200);
            t.addClass('maximize');
            t.html('&plus;');
        } else {
            p.find('.panel-body, .panel-footer').slideDown(200);
            t.removeClass('maximize');
            t.html('&minus;');
        }
        return false;
    });
    // Close Button in Panels
    contentInner.on("click", '.panel .panel-close', function () {
        $(this).closest('.panel').fadeOut(200);
        return false;
    });
    $('#leftpanel').perfectScrollbar();
    // noinspection JSCheckFunctionSignatures
    $('.nav-parent > a').click(function () {
        const parent = $(this).parent();
        const sub = parent.find('> ul');
        // Dropdown works only when leftpanel is not collapsed
        if (!$('body').hasClass('leftpanel-collapsed')) {
            if (sub.is(':visible')) {
                sub.slideUp(200, function () {
                    parent.removeClass('nav-active');
                    $('.mainpanel').css({height: ''});
                    panelHeight()
                })
            } else {
                closeVisible();
                parent.addClass('nav-active');
                sub.slideDown(200, function () {
                    panelHeight()
                });
            }
        }
        return false;
    });
    $('.nav-bracket > li').hover(function () {
        $(this).addClass('nav-hover');
    }, function () {
        $(this).removeClass('nav-hover');
    });
    $('.toggle').toggles({on: true});
    $('.toggle-chat1').toggles({on: false});
    // noinspection JSCheckFunctionSignatures
    $('.menutoggle').click(function () {
        const body = $('body');
        const bodyPos = body.css('position');
        if (bodyPos !== 'relative') {
            if (!body.hasClass('leftpanel-collapsed')) {
                body.addClass('leftpanel-collapsed');
                $('.nav-bracket ul').attr('style', '');
                $(this).addClass('menu-collapsed');
            } else {
                body.removeClass('leftpanel-collapsed chat-view');
                $('.nav-bracket li.active ul').css({display: 'block'});
                $(this).removeClass('menu-collapsed');
            }
        } else {
            if (body.hasClass('leftpanel-show'))
                body.removeClass('leftpanel-show');
            else
                body.addClass('leftpanel-show');
            panelHeight()
        }
    });
}

/*********************************************************/
const initFormSend = function (elements) {
    fadeOutSite();
    const btn = elements.find(".submit-finish");
    btn.addClass('disabled');
    btn.find('i').eq(0).addClass('fa-spin');
    elements.find('.help-block').text("");
};
const initFormBack = function (elements) {
    const btn = elements.find(".submit-finish");
    btn.removeClass('disabled');
    btn.find('i').eq(0).removeClass('fa-spin');
    vars.contentInner.fadeTo('fast', 1);
    NProgress.done();
};
const fadeOutSite = function () {
    NProgress.start();
    // NProgress.set(0.3);
    NProgress.inc(0.4);
    vars.contentInner.fadeTo('fast', .5);
};
const fadeInSiteMain = function () {
    adjustHeight();
    // noinspection JSCheckFunctionSignatures
    $('html, body').animate({scrollTop: 0}, 0, function () {
        $.material.init();
        jQuery('.mainpanel').height('100%');
        vars.contentInner.fadeTo('fast', 1);
        NProgress.done();
    })
};
const fadeInSite = function () {
    $.material.init();
    jQuery('.mainpanel').height('100%');
    vars.contentInner.fadeTo('fast', 1);
    NProgress.done();
};
const adjustHeight = function () {
    const docHeight = _document.height();
    if (docHeight > jQuery('.mainpanel').height())
        $('.mainpanel').height(docHeight);
};
const panelHeight = function () {
    const docHeight = _document.height();
    if (docHeight > jQuery('.mainpanel').height())
        $('.mainpanel').height(docHeight);
};
const closeVisible = function () {
    $('.nav-parent').each(function () {
        let t = $(this);
        if (t.hasClass('nav-active')) {
            t.find('> ul').slideUp(200, function () {
                t.removeClass('nav-active');
            })
        }
    })
};
/**********************************************************/
// noinspection JSUnusedLocalSymbols
const mainOnSuccessSubmit = function (data, textStatus, xhr) {
    jQuery.gritter.add({title: data.message, text: "", class_name: 'growl-success', sticky: false, time: ''});
    // noinspection JSUnresolvedVariable
    if (data.with_data != null) {
        if (data.type === 'redirect_to') {
            // noinspection JSUnresolvedVariable
            window.location.href = data.url_to;
        }

        if (data.type === 'popular') {
            // noinspection JSUnresolvedVariable
            const item = $('#popular_' + data.popular_id);
            if (data.status === 'add') {
                item.find(".add_to_popular_btn").eq(0).hide(0);
                item.find(".remove_from_popular_btn").eq(0).removeClass('hidden');
                item.find(".remove_from_popular_btn").eq(0).show();
            } else if (data.status === 'remove') {
                item.find(".remove_from_popular_btn").eq(0).hide(0);
                item.find(".add_to_popular_btn").eq(0).removeClass('hidden');
                item.find(".add_to_popular_btn").eq(0).show();
            }
        }
        if (data.type === 'change_default_branch') {
            // noinspection JSUnresolvedVariable
            const previousBranch = $('#make_default_' + data.previous_branch);
            previousBranch.find(".is_default_branch_btn").eq(0).hide(0);
            previousBranch.find(".make_default_branch_btn").eq(0).removeClass('hidden');
            previousBranch.find(".make_default_branch_btn").eq(0).show(0);
            // noinspection JSUnresolvedVariable
            const currentBranch = $('#make_default_' + data.current_branch);
            currentBranch.find(".make_default_branch_btn").eq(0).hide(0);
            currentBranch.find(".is_default_branch_btn").eq(0).removeClass('hidden');
            currentBranch.find(".is_default_branch_btn").eq(0).show(0);
        }
        if (data.type === 'user_change_status') {
            // noinspection JSUnresolvedVariable
            const statusSpan = $('#change_status_span_' + data.user_id);
            // noinspection JSUnresolvedVariable
            const changeStatusForm = $('#change_status_' + data.user_id);
            if (data.status === 'active') {
                statusSpan.text("Active");
                changeStatusForm.find(".make_active_user_btn").eq(0).hide(0);
                changeStatusForm.find(".make_inactive_user_btn").eq(0).removeClass('hidden');
                changeStatusForm.find(".make_inactive_user_btn").eq(0).show(0);
            }
            else if (data.status === 'inactive') {
                statusSpan.text("Inactive");
                changeStatusForm.find(".make_inactive_user_btn").eq(0).hide(0);
                changeStatusForm.find(".make_active_user_btn").eq(0).removeClass('hidden');
                changeStatusForm.find(".make_active_user_btn").eq(0).show(0);
            }
        }

    }
    initFormBack(this.dataNew.parent);
};
const mainOnErrorSubmit = function (xhr) {
    const data = xhr.responseJSON;
    const dataArray = [this.dataNew.parent];
    jQuery.gritter.add({title: data.message, text: "", class_name: 'growl-danger', sticky: false, time: ''});
    if (data.validator != null) {
        $.each(data.validator, function (key, value) {
            const inp = dataArray[0].find("#" + key);
            let parent = inp.parent('div');
            parent.find('.help-block').eq(0).text(value);
            parent.addClass('has-error');
            parent.addClass('is-focused ');
            if (inp.val() === "")
                parent.addClass('is-empty');
        })
    }
    initFormBack(this.dataNew.parent)
};
const mainBeforeSubmit = function () {
    if (!formValidationById(this.dataNew.parent.context.id)) return false;
    initFormSend(this.dataNew.parent);
};
/**********************************************************/
const postFormAjax = function (formTarget, beforeSubmit, onSuccess, onError) {
    $(formTarget).submit(function (e) {
        e.preventDefault();
        const form = $(this);
        const parent = form.parents('.panel-body').eq(0);
        $.ajax({
            type: 'post',
            url: form.attr('action'),
            data: new FormData(form[0]),
            dataType: 'json',
            timeout: 30000,
            cache: false,
            contentType: false,
            processData: false,
            dataNew: {parent: parent, form: form},
            beforeSend: beforeSubmit,
            success: onSuccess,
            error: onError
        })
    })
};
const loadLinkAjax = function () {
    let status = false;
    const _body = $('body');
    _document.on('click', '.load_content_ajax', function (e) {
        e.preventDefault();
        const obj = $(this);
        if (_document.url === obj.attr('href') && status)
            return;
        // noinspection JSUnusedLocalSymbols
        $.ajax({
            type: "GET", url: obj.attr('href'), async: true,
            beforeSend: function (xhr) {
                status = false;
                if (_body.hasClass('leftpanel-show'))
                    _body.removeClass('leftpanel-show');
                fadeOutSite()
            },
            success: function (data) {
                _document.url = obj.attr('href');
                status = true;
                //$('#content-inner').html(data.html)
                vars.contentInner.html($("#content-inner", data).html());
                reloadedScripts();
                fadeInSiteMain();
            },
            error: function (xhr) {
                $('#content-inner').html("<div class='notfoundpanel'><h1>404!</h1><h3>The page you are looking for has not been found!</h3></div>");
                fadeInSiteMain();
            }
        }).done(function (data) {
            status = true;
            const parent = obj.parent();
            const rootParent = obj.parents('.nav-parent').get(0);
            parent.siblings().each(function () {
                let $this = $(this);
                $this.removeClass('active');
                $this.removeClass('nav-active');
                $this.find('ul').attr('style', '');
                $this.find('ul li').removeClass('active');
            });
            parent.addClass('active');
            if (rootParent != null) {
                $(rootParent).siblings().each(function () {
                    $(this).removeClass('active');
                    $(this).removeClass('nav-active');
                    $(this).find('ul li').removeClass('active');
                });
                $(rootParent).addClass('active');
            }
        })
    })
};
const loadMoreAjax = function () {
    _document.on('click', '.load-more-ajax', function (e) {
        e.preventDefault();
        const obj = $(this);
        const parent = obj.parents('.load-more-ajax-wrapper').eq(0);
        // noinspection JSUnusedLocalSymbols
        $.ajax({
            url: obj.attr('href'),
            beforeSend: function (xhr) {
                obj.html('<i class="fa fa-cog fa-spin"></i>');
                obj.addClass('disabled');
            },
            success: function (data) {
                obj.remove();
                parent.append(data.html);
                if ($('form.submit-ajax').length > 0)
                    postFormAjax('form.submit-ajax', mainBeforeSubmit, mainOnSuccessSubmit, mainOnErrorSubmit);
                adjustHeight();
            },
            error: function (xhr) {
            }
        })
    })
};
const deleteItem = function () {
    _document.on('submit', '.delete-ajax', function (e) {
        e.preventDefault();
        if (confirm('Are you sure ..') === false) {
            return false
        }
        const $this = $(this);
        const btn = $this.find('button').eq(0);
        let parent = $this.parents('.sort-root');
        if (!parent.length) {
            parent = btn.parents('.panel-default').eq(0)
        }
        const icon = btn.find('.fa');
        // noinspection JSUnusedLocalSymbols
        $.ajax({
            url: $this.attr('action'), type: 'post', data: $this.serialize(), dataType: 'json',
            beforeSend: function (xhr) {
                btn.addClass('disabled');
                icon.removeClass('fa-trash-o');
                icon.addClass('fa-cog fa-spin');
            },
            success: function (data) {
                parent.slideUp(500, function () {
                    parent.remove();
                    jQuery.gritter.add({
                        title: data.message,
                        text: "",
                        class_name: 'growl-success',
                        sticky: false,
                        time: ''
                    });
                })
            },
            error: function (xhr) {
                const data = xhr.responseJSON;
                $('.gritter-item-wrapper').remove();
                jQuery.gritter.add({
                    title: data.message,
                    text: "",
                    class_name: 'growl-danger',
                    sticky: false,
                    time: 2000
                });
                icon.removeClass('fa-cog fa-spin');
                icon.addClass('fa-trash-o');
                btn.removeClass('disabled');
            }
        })
    })
};
const sortableItems = function () {
    const parentSortable = document.getElementById('multi');
    if (parentSortable != null) {
        _document.on('click', '.sort-button', function (e) {
            e.preventDefault();
        });
        // noinspection JSUnusedLocalSymbols
        Sortable.create(parentSortable, {
            scroll: true,
            animation: 150,
            draggable: '.sort-root',
            handle: '.sort-button',
            onUpdate: function (evt) {
                const url = vars.mainURL + '/admin/post/ordered_change';
                const order_id = $('input[name="order_id[]"]').map(function () {
                    return this.value
                }).get();
                const _token = $('#sort-button_save').val();
                $.ajax({
                    type: "POST", url: url, async: true,
                    data: {'order_id[]': order_id, '_token': _token},
                    beforeSend: function (xhr) {
                    },
                    success: function (data) {
                        jQuery.gritter.add({
                            title: data.message,
                            text: "",
                            class_name: 'growl-success',
                            sticky: false,
                            time: ''
                        });
                    },
                    error: function (xhr) {
                    }
                })
            }
        });
        $('#multi').disableSelection();
    }
};
const disabledItems = function () {
    const pass = $('.passcheck');
    if (pass.length > 0) {
        pass.attr("disabled", 'disabled');
        // noinspection JSCheckFunctionSignatures
        $('#have_other_inputs_update').click(function () {
            if (!pass.attr("disabled"))
                pass.attr("disabled", 'disabled');
            else
                pass.removeAttr("disabled");
        })
    }
};
/**********************************************************/
const moduleJs = function () {
    const addOtherBtn = $(".add_field_button");
    if (addOtherBtn.length > 0) {
        const otherWrapper = $("#input_fields_wrap");
        // noinspection JSCheckFunctionSignatures
        addOtherBtn.click(function (e) {
            e.preventDefault();
            // noinspection JSValidateTypes
            const template = $('#template_other_input').children().clone();
            $(otherWrapper).append(template);
        });
        otherWrapper.on("click", ".remove_field", function (e) {
            e.preventDefault();
            $(this).parent('div').parent('div').remove();
        })
    }
    const addAliasBtn = $('#add_alias_btn');
    if (addAliasBtn.length > 0) {
        const aliasWrapper = $("#add_alias_wrap");
        // noinspection JSCheckFunctionSignatures
        addAliasBtn.click(function (e) {
            e.preventDefault();
            // noinspection JSValidateTypes
            const template = $('#add_alias_template').children().clone();
            aliasWrapper.prepend(template);
        });
        aliasWrapper.on("click", ".remove_alias_btn", function (e) {
            e.preventDefault();
            $(this).parent('div').parent('div').parent('div').remove()
        })
    }
    const addRulesBtn = $("#add_rules_btn");
    if (addRulesBtn.length > 0) {
        const rulesWrapper = $("#add_rules_wrap");
        // noinspection JSCheckFunctionSignatures
        addRulesBtn.click(function (e) {
            e.preventDefault();
            // noinspection JSValidateTypes
            const template = $('#add_rules_template').children().clone();
            rulesWrapper.prepend(template)
        });
        rulesWrapper.on("click", ".remove_rules_btn", function (e) {
            e.preventDefault();
            $(this).parent('div').parent('div').parent('div').remove();
        })
    }
};
const socialItem = function (addBtn, parent, temp) {
    let mainWrapper;
    if (addBtn.length > 0) {
        mainWrapper = $(parent);
        // noinspection JSCheckFunctionSignatures
        $(addBtn).click(function (e) {
            e.preventDefault();
            $(temp).find('.item-wrap').eq(0).clone().insertBefore($(this));
        });
        mainWrapper.on("click", ".remove_field", function (e) {
            e.preventDefault();
            $(this).parents('.item-wrap').remove();
        })
    }
};
/**********************************************************/
const summerNoteDesc = function (elements) {
    const desc = elements;
    if (desc.length > 0) {
        const editor = desc.summernote({
            //height: 180,
            toolbar: [
                ['misc', ['fullscreen', 'bold', 'italic', 'underline', 'clear', 'fontsize']],
                ['para', ['paragraph']],
                ['color', ['color']],
                ['insert', ['ul', 'ol', 'link', 'video', 'picture', 'table', 'hr']],
                ['misc', ['codeview', 'help']]
            ],
            lang: 'ar-AR', // default: 'en-US'
            disableResizeEditor: false,
            dialogsInBody: false,
            shortcut: false,
            disableDragAndDrop: true,
            onImageUpload: function (files) {
                console.log('image upload:', files);
                const data = new FormData();
                data.append("file", files[0]);
                data.append("_token", $('input[name="_token"]').val());
                $.ajax({
                    url: 'http://' + window.location.hostname + '/admin/post/upload_file', // Url to which the request is send
                    type: "POST",             // Type of request to be send, called as method
                    data: data,               // Data sent to server, a set of key/value pairs (i.e. form fields and values)
                    contentType: false,       // The content type used when sending data to the server.
                    cache: false,             // To unable request pages to be cached
                    processData: false,        // To send DOMDocument or non processed data file it is set to false
                    success: function (data) {   // A function to be called if request succeeds
                        //var data = jQuery.parseJSON(data)
                        //alert(data.filename)
                        /** @namespace data.filename */
                        let imgNode = data.filename;
                        // noinspection RequiredAttributes
                        imgNode = $('<img>').attr('src', imgNode);
                        editor.summernote('insertNode', imgNode[0]); // insert native dom
                    }
                })
            },
            //onMediaDelete : function($target, editor, $editable) {},
            onInit: function () {
                $('.note-editable').css('min-height', '160px')
            }
        })
    }
};
const summerNoteShort = function (elements) {
    const shortArea = elements;
    if (shortArea.length > 0) {
        shortArea.summernote({
            // height: 120,
            lang: 'ar-AR', // default: 'en-US'
            disableDragAndDrop: true,
            toolbar: [
                ['style', ['fullscreen', 'bold', 'italic', 'clear']],
                ['para', ['paragraph']],
                ['misc', ['codeview']]
            ],
            onInit: function () {
                $('.note-editable').css('min-height', '200px')
            }
        })
    }
};
const formWizard = function (elements) {
    const formWizardItem = elements;
    if (formWizardItem.length > 0) {
        // noinspection JSUnusedLocalSymbols
        formWizardItem.bootstrapWizard({
            tabClass: 'nav nav-pills nav-justified nav-disabled-click',
            nextSelector: '.next',
            previousSelector: '.previous',
            onTabClick: function (tab, navigation, index) {
                return false
            },
            onNext: function (tab, navigation, index) {
                if (formValidationById(formWizardItem.find('.submit-ajax').attr('id')) === false) return false;
                const $total = navigation.find('li').length;
                const $current = index + 1;
                const $percent = ($current / $total) * 100;
                navigation.parents('.form-wizard').eq(0).find('.progress-bar').css('width', $percent + '%');
            },
            onPrevious: function (tab, navigation, index) {
                console.log(navigation);
                const $total = navigation.find('li').length;
                const $current = index + 1;
                const $percent = ($current / $total) * 100;
                navigation.parents('.form-wizard').eq(0).find('.progress-bar').css('width', $percent + '%');
            },
            onTabShow: function (tab, navigation, index) {
                const $total = navigation.find('li').length;
                const $current = index + 1;
                const $percent = ($current / $total) * 100;
                navigation.parents('.form-wizard').eq(0).find('.progress-bar').css('width', $percent + '%');
            }
        })
    }
};
const dropZoneGallery = function () {
    Dropzone.autoDiscover = false;
    const galleryUpload = $('#gallery-upload');
    if (galleryUpload.length > 0) {
        const mainUrl = galleryUpload.attr('action');
        const addUrl = mainUrl + '/' + 'add';
        const getUrl = mainUrl + '/' + 'get';
        const delUrl = mainUrl + '/' + 'delete';
        const pathArray = window.location.pathname.split('/');
        const folder = 'http://' + window.location.hostname + '/public/upload/posts/' + pathArray[3] + '/gallery';
        const myDropzone = new Dropzone("form#gallery-upload", {
            url: addUrl,
            paramName: 'file',
            maxFiles: 10,
            addRemoveLinks: true
        });
        $.get(getUrl, null, function (data) {
            const images = JSON.parse(data);
            $.each(images, function (key, value) {
                let mockFile = {name: value.name, size: value.size};
                myDropzone.options.addedfile.call(myDropzone, mockFile);
                myDropzone.options.thumbnail.call(myDropzone, mockFile, folder + '/' + value.name);
            })
        });
        myDropzone.on("sending", function (file, xhr, data) {
        });
        myDropzone.on("removedfile", function (file) {
            $('.dz-remove').css('display', 'none');
            // noinspection JSValidateTypes
            const name = $(file.previewTemplate).children('div.dz-details').children('div.dz-filename').children('span').text();
            const Path = delUrl + '/' + name; // var name = file.name
            // noinspection JSUnusedLocalSymbols
            $.get(Path, null, function (data) {
                $('.dz-remove').css('display', 'block');
            })
        });
        myDropzone.on("success", function (file, data) {
            // noinspection JSValidateTypes
            $(file.previewTemplate).children('div.dz-details').children('div.dz-filename').children('span').text(data.filename);
        })
    }
};
/**********************************************************/
// noinspection JSUnusedGlobalSymbols
const validateWithoutZero = function (evt) {
    // noinspection EqualityComparisonWithCoercionJS
    if ((evt.code == 'ArrowLeft') || (evt.code == 'ArrowRight') || (evt.code == 'ArrowUp') || (evt.code == 'ArrowDown') || (evt.code == 'Delete') || (evt.code == 'Backspace')) {
        return
    }
    const theEvent = evt || window.event;
    let key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode(key);
    const regex = /[0-9]|\./;
    // noinspection EqualityComparisonWithCoercionJS
    if (!regex.test(key) || (evt.target.value == "" && key == 0)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault) theEvent.preventDefault()
    }
    // noinspection SpellCheckingInspection
    evt.target.onkeyup = function (e) {
        setTimeout(
            function () {
                // noinspection EqualityComparisonWithCoercionJS
                if (parseFloat(e.target.value) <= 0 || parseFloat(e.target.value) == 'NaN')
                    e.target.value = null
            }, 1500
        )
    }
};
const NumbersOnly = function (evt) {
    if ((evt.code === 'ArrowLeft') || (evt.code === 'ArrowRight') || (evt.code === 'ArrowUp') || (evt.code === 'ArrowDown') || (evt.code === 'Delete') || (evt.code === 'Backspace')) return;

    const theEvent = evt || window.event;
    let key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode(key);
    const regex = /[0-9]|\+/;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault)
            theEvent.preventDefault();
    }
};
const validatorHighlight = function (element) {
    $(element).closest('.form-group').removeClass('has-success').addClass('has-error')
};
const validatorSuccess = function (element) {
    $(element).closest('.form-group').removeClass('has-error')
};
/**********************************************************/
const createDishScript = function (dish_form) {
    const dishForm = $(dish_form);
    if (dishForm.length > 0) {
        postFormAjax('form#submit-ajax-new-dish', createDishBefore, mainOnSuccessSubmit, mainOnErrorSubmit)
    }
};
const createDishValidations = function (dishForm) {
    const $validator = dishForm.validate({
        rules: {
            "category_id": {required: true},
            "is_active": {required: true},
            "price": {required: true, number: true},
            "image_ar": {
                required: true,
                accept: 'image/jpg,image/jpeg,image/png',
                filesize: 1024 * 1024 * .300
            },

            "image_en": {
                required: true,
                accept: 'image/jpg,image/jpeg,image/png',
                filesize: 1024 * 1024 * .300
            },
            "name_ar": {required: true, maxlength: 75},
            "name_en": {required: true, maxlength: 75},
            "details_ar": {required: true, maxlength: 500},
            "details_en": {required: true, maxlength: 500},
            'slug_ar': {required: true, maxlength: 150},
            'slug_en': {required: true, maxlength: 150},
            "alt_meta_ar": {required: true, maxlength: 75},
            "alt_meta_en": {required: true, maxlength: 75}
        },
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            $(element).closest('.form-group').removeClass('has-error');
        }
    });

    dishForm.find('.chosen-container').eq(0).parents('.form-group').removeClass('has-error');
    dishForm.find('.chosen-select').each(function () {
        if ($(this).attr('value') === 'null')
            dishForm.find('.chosen-container').eq(0).parents('.form-group').addClass('has-error');
    });

    const t = $('.price-input-parent input');
    for (let i = 0; i < t.length; i++) {
        t.eq(i).rules("add", "required");
        t.eq(i).rules("add", "number");
    }

    const imageAr = $('#image_ar');
    if (imageAr.hasClass('fileinput-new')) {
        imageAr.find('input[type="file"]').eq(0).rules("add", "required");
    }
    if (imageAr.hasClass('fileinput-exists')) {
        imageAr.find('input[type="file"]').eq(0).rules("remove", "required");
        imageAr.find('input[type="file"]').eq(0).removeAttr("required");
    }
    const imageEn = $('#image_en');
    if (imageEn.hasClass('fileinput-new')) {
        imageEn.find('input[type="file"]').eq(0).rules("add", "required");
    }
    if (imageEn.hasClass('fileinput-exists')) {
        imageEn.find('input[type="file"]').eq(0).rules("remove", "required");
        imageEn.find('input[type="file"]').eq(0).removeAttr("required");
    }

    if (!dishForm.valid()) {
        $validator.focusInvalid();
        return false;
    }
    return true;
};
const createDishBefore = function () {
    initFormSend(this.dataNew.parent);
    if (!createDishValidations(this.dataNew.form)) {
        initFormBack(this.dataNew.parent);
        return false;
    }
};
const filterDishesByCategory = function () {
    $(document).on('submit', 'form.search-ajax-submit', function (e) {
        e.preventDefault();
        const form = $(this);
        const containerSearch = $('.load-more-ajax-wrapper');
        // noinspection JSUnusedLocalSymbols
        $.ajax({
            url: form.attr('action'),
            data: form.serialize(),
            beforeSend: function (xhr) {
                form.find('.submit-finish').prop('disabled', true);
            },
            success: function (data) {
                form.find('.submit-finish').prop('disabled', false);
                containerSearch.html(data.html);
                $.material.init();
            },
            error: function (xhr) {
                /** @namespace xhr.responseJSON */
                const data = xhr.responseJSON;
                form.find('.submit-finish').prop('disabled', false);
                containerSearch.html("");
                jQuery.gritter.add({
                    title: data.message,
                    text: "",
                    class_name: 'growl-danger',
                    sticky: false,
                    time: ''
                });
            }
        })
    })
};
/**********************************************************/
const formValidationById = function (fromId) {
    if (fromId === 'social_config') {
        if (socialValidation() === false)
            return false;
    }
    if (fromId === 'main_config') {
        if (mainConfigValidation() === false)
            return false;
    }
    if (fromId === 'users-management') {
        if (mainUsersManagementValidation() === false)
            return false;
    }
    if (fromId === 'branch-management') {
        if (branchManagementValidation() === false)
            return false;
    }
    if (fromId === 'categories-management') {
        if (categoriesManagementValidation() === false)
            return false;
    }
    if (fromId === 'edit_how_it_works') {
        if (howItWorksValidation() === false)
            return false;
    }
    if (fromId === 'create_slider' || fromId === 'edit_slider') {
        if (sliderValidation() === false)
            return false;
    }
    if (fromId === 'edit_about') {
        if (aboutValidation() === false)
            return false;
    }
    if (fromId === 'edit_slider_text') {
        if (sliderTextValidation() === false)
            return false;
    }
    if (fromId === 'create_clients' || fromId === 'edit_clients'){
        if(clientsValidation() === false)
            return false;
    }
    if (fromId === 'create_sectors' || fromId === 'edit_sectors'){
        if(sectorsValidation() === false)
            return false;
    }
    if (fromId === 'create_news' || fromId === 'edit_news'){
        if(newsValidation() === false)
            return false;
    }
    if (fromId === 'edit_organization_chart'){
        if(organizationChartValidation() === false)
            return false;
    }
    if (fromId === 'edit_our_mission'){
        if(ourMissionValidation() === false)
            return false;
    }
    if (fromId === 'edit_certificates'){
        if(certificatesValidation() === false)
            return false;
    }
    if (fromId === 'edit_chairmans_message'){
        if(chairmansMessageValidation() === false)
            return false;
    }
    return true;
};

function setInputsLength() {
    const mainForm = $('.general-form');
    if (mainForm.length > 0) {
        let formId = mainForm.attr("id");
        if (formId === 'edit_how_it_works') {
            $("#name_en , #name_ar").attr('maxLength', 75);
            $("#short_desc_en , #short_desc_ar").attr('maxLength', 150);
        }
        else if (formId === 'edit_about') {
            $("#name_en , #name_ar").attr('maxLength', 75);
            $("#home_brief_en , #home_brief_en").attr('maxLength', 200);
        }
        else if (formId === 'edit_slider'|| formId === 'create_slider') {
            $("#name_en , #name_ar").attr('maxLength', 75);
        }
        else if (formId === 'edit_news'|| formId === 'create_news') {
            $("#name_en , #name_ar").attr('maxLength', 75).keypress(charsOnly).bind('cut copy paste', function (e) {e.preventDefault()});
            $("#brief_en , #brief_ar").attr('maxLength', 157);
            $("#short_en , #short_ar").attr('maxLength', 2000);
        }
        else if (formId === 'edit_certificates') {
            $("#name_en , #name_ar").attr('maxLength', 75);
            $("#brief_en , #brief_ar").attr('maxLength', 157);

        }
        else if (formId === 'edit_organization_chart') {
            $("#name_en , #name_ar").attr('maxLength', 75);
        }
        else if (formId === 'edit_chairmans_message') {
            $("#name_en , #name_ar").attr('maxLength', 30);
            $("#summary_en , #summary_ar").attr('maxLength', 2000);
            $("#brief_en , #brief_ar").attr('maxLength', 300);
        }
        else if (formId === 'main_config') {
            $("#site_name_en, #site_name_ar").attr('maxLength', 60);
            $("#site_desc_en, #site_desc_ar").attr('maxLength', 100);
            const site_phones = $("#site_phone_en, #site_phone_ar");
            site_phones.attr('maxLength', 8);
            site_phones.keypress(NumbersOnly);

        }
        else if (formId === 'create_clients' || formId === 'edit_clients') {
            $("#name_en , #name_ar").attr('maxLength', 57);
        }
        else if (formId === 'create_sectors' || formId === 'edit_sectors') {
            $("#name_en , #name_ar").attr('maxLength', 75).keypress(charsOnly).bind('cut copy paste', function (e) {e.preventDefault()});
            $("#brief_en , #brief_ar").attr('maxLength', 157);
            $("#short_en , #short_ar").attr('maxLength', 2000);

        }
        else if (formId === 'branch-management') {
            $("#name_en , #name_ar").attr('maxLength', 60);
            $("#email").attr('maxLength', 60);
        }
    }
}

function socialValidation() {
    const socialForm = $('#social_config');
    if (socialForm.length > 0) {
        let $validator;
        $validator = socialForm.validate({
            ignore: [],
            rules: {
                'social_link[]': {url: true}
            }
        });
        if (!socialForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function mainConfigValidation() {
    const mainConfigForm = $('#main_config');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'site_name_en': {required: true, maxlength: 60},
                'site_name_ar': {required: true, maxlength: 60},
                'site_phone': {required: true, maxlength: 8, number: true},
                'site_email': {required: true, email: true},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function categoriesManagementValidation() {
    const mainConfigForm = $('#categories-management');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'name_ar': {required: true, maxlength: 50},
                'slug_ar': {required: true, maxlength: 150},
                'name_en': {required: true, maxlength: 50},
                'slug_en': {required: true, maxlength: 150}

            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function mainUsersManagementValidation() {
    const mainConfigForm = $('#users-management');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'first_name': {required: true, maxlength: 25},
                'last_name': {required: true, maxlength: 25},
                'password': {required: true, minlength: 8, maxlength: 25},
                'confirmPassword': {required: true, equalTo: "#password"},
                'email': {required: true, email: true},
                'role_id': {required: true, selectRequired: 'null'},
                'gender': {required: true, selectRequired: 'null'},
                'active': {required: true, maxlength: 1},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function branchManagementValidation() {
    const mainConfigForm = $('#branch-management');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'is_active': {required: true},
                'latitude': {required: true, number: true, maxlength: 40},
                'longitude': {required: true, number: true, maxlength: 40},
                'name_ar': {required: true, maxlength: 60},
                'name_en': {required: true, maxlength: 60},
                'address_ar': {required: true, maxlength: 150},
                'address_en': {required: true, maxlength: 150},
                'phone': {required: true, maxlength: 8, number: true},
                'phones': {maxlength: 8, number: true},
                'email': {maxlength: 60, email:true},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        mainConfigForm.find('.chosen-container').eq(0).parents('.form-group').removeClass('has-error');
        mainConfigForm.find('.chosen-select').each(function () {
            if ($(this).attr('value') === 'null')
                mainConfigForm.find('.chosen-container').eq(0).parents('.form-group').addClass('has-error');
        });
        const t = $('.price-input-parent input');
        for (let i = 0; i < t.length; i++) {
            t.eq(i).rules("add", "required");
            t.eq(i).rules("add", "number");
        }
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function howItWorksValidation() {
    const mainConfigForm = $('#edit_how_it_works');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'short_desc_ar': {required: true, maxlength: 150},
                'short_desc_en': {required: true, maxlength: 150},
                'upload_ar': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'upload_en': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        const imageAr = $('#upload_ar');
        if (imageAr.hasClass('fileinput-new')) {
            imageAr.find('input[type="file"]').eq(0).rules("add", "required");
        }
        if (imageAr.hasClass('fileinput-exists')) {
            imageAr.find('input[type="file"]').eq(0).rules("remove", "required");
            imageAr.find('input[type="file"]').eq(0).removeAttr("required");
        }
        const imageEn = $('#upload_en');
        if (imageEn.hasClass('fileinput-new')) {
            imageEn.find('input[type="file"]').eq(0).rules("add", "required");
        }
        if (imageEn.hasClass('fileinput-exists')) {
            imageEn.find('input[type="file"]').eq(0).rules("remove", "required");
            imageEn.find('input[type="file"]').eq(0).removeAttr("required");
        }


        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function sliderValidation() {
    const mainConfigForm = $('#create_slider, #edit_slider');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'upload_ar': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'upload_en': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        const imageAr = $('#upload_ar');
        if (imageAr.hasClass('fileinput-new')) {
            imageAr.find('input[type="file"]').eq(0).rules("add", "required");
        }
        if (imageAr.hasClass('fileinput-exists')) {
            imageAr.find('input[type="file"]').eq(0).rules("remove", "required");
            imageAr.find('input[type="file"]').eq(0).removeAttr("required");
        }
        const imageEn = $('#upload_en');
        if (imageEn.hasClass('fileinput-new')) {
            imageEn.find('input[type="file"]').eq(0).rules("add", "required");
        }
        if (imageEn.hasClass('fileinput-exists')) {
            imageEn.find('input[type="file"]').eq(0).rules("remove", "required");
            imageEn.find('input[type="file"]').eq(0).removeAttr("required");
        }


        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function aboutValidation() {
    const mainConfigForm = $('#edit_about');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'home_brief_en': {required: true, maxlength: 200},
                'home_brief_ar': {required: true, maxlength: 200},
                'upload_ar': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'upload_en': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        const imageAr = $('#upload_ar');
        if (imageAr.hasClass('fileinput-new')) {
            imageAr.find('input[type="file"]').eq(0).rules("add", "required");
        }
        if (imageAr.hasClass('fileinput-exists')) {
            imageAr.find('input[type="file"]').eq(0).rules("remove", "required");
            imageAr.find('input[type="file"]').eq(0).removeAttr("required");
        }
        const imageEn = $('#upload_en');
        if (imageEn.hasClass('fileinput-new')) {
            imageEn.find('input[type="file"]').eq(0).rules("add", "required");
        }
        if (imageEn.hasClass('fileinput-exists')) {
            imageEn.find('input[type="file"]').eq(0).rules("remove", "required");
            imageEn.find('input[type="file"]').eq(0).removeAttr("required");
        }
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function sliderTextValidation() {
    const mainConfigForm = $('#edit_slider_text');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'slider_description_en': {required: true, maxlength: 150},
                'slider_description_ar': {required: true, maxlength: 150}
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function clientsValidation(){
    const mainConfigForm_1 = $('#create_clients');
    const mainConfigForm_2 = $('#edit_clients');
    if (mainConfigForm_1.length > 0) {
        let $validator;
        $validator = mainConfigForm_1.validate({
            rules: {
                'name_en': {required: true, maxlength: 57},
                'name_ar': {required: true, maxlength: 57},
                'upload_en': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'upload_ar': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                }

            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm_1.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    if (mainConfigForm_2.length > 0) {
        let $validator;
        $validator = mainConfigForm_2.validate({
            rules: {
                'name_en': {required: true, maxlength: 57},
                'name_ar': {required: true, maxlength: 57},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });

        if (!mainConfigForm_2.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function sectorsValidation() {
    const mainConfigForm_1 = $('#create_sectors');
    if (mainConfigForm_1.length > 0) {
        let $validator;
        $validator = mainConfigForm_1.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'brief_en': {required: true ,maxlength:157},
                'brief_ar': {required: true,maxlength:157},
                'short_en': {required: true,maxlength:2000},
                'short_ar': {required: true,maxlength:2000},
                'upload_en': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'upload_ar': {
                    required: true,
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'secondary_img_en':{
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'secondary_img_ar':{
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                }

            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm_1.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    const mainConfigForm_2 = $('#edit_sectors');
    if (mainConfigForm_2.length > 0) {
        let $validator;
        $validator = mainConfigForm_2.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'brief_en': {required: true ,maxlength:157},
                'brief_ar': {required: true,maxlength:157},
                'short_en': {required: true,maxlength:2000},
                'short_ar': {required: true,maxlength:2000},
                'secondary_img_en':{
                accept: 'image/jpg,image/jpeg,image/png',
                filesize: 1024 * 1024 * .300
            },
                'secondary_img_ar':{
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                }

            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm_2.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function newsValidation() {
    const mainConfigForm = $('#create_news,#edit_news');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            // ignore: ':not(#summernote),.note-editable.panel-body',
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'brief_en': {required: true ,maxlength:157},
                'brief_ar': {required: true,maxlength:157},
                'short_en': {valueNotEqualsAbout:true, maxlength:2000}.ignore='.note-editor *',
                'short_ar': {valueNotEqualsAbout:true, maxlength:2000},
            },
            highlight: validatorHighlight,
            success: validatorSuccess,
            errorPlacement: function (error, element) {
                // Add the `help-block` class to the error element
                if (element.hasClass("short-area")) {
                    error.insertAfter(element.siblings(".note-editor"));
                } else {
                    error.insertAfter(element);
                }
            }
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function organizationChartValidation() {
    const mainConfigForm = $('#edit_organization_chart');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function ourMissionValidation() {
    const mainConfigForm = $('#edit_our_mission');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'our_mission_en': {required: true, maxlength: 300},
                'our_mission_ar': {required: true, maxlength: 300},
                'our_vission_en': {required: true, maxlength: 300},
                'our_vission_ar': {required: true, maxlength: 300},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function certificatesValidation() {
    const mainConfigForm = $('#edit_certificates');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                'name_en': {required: true, maxlength: 75},
                'name_ar': {required: true, maxlength: 75},
                'brief_en': {required: true ,maxlength:157},
                'brief_ar': {required: true,maxlength:157},
                'certificate_1_en': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'certificate_1_ar': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'certificate_2_en': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'certificate_2_ar': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'certificate_3_en': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'certificate_3_ar': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                }
            },
            messages: {
                'certificate_1_en': {filesize: 'Image size must be less than 300 kb'},
                'certificate_1_ar': {filesize: 'Image size must be less than 300 kb'},
                'certificate_2_en': {filesize: 'Image size must be less than 300 kb'},
                'certificate_2_ar': {filesize: 'Image size must be less than 300 kb'},
                'certificate_3_en': {filesize: 'Image size must be less than 300 kb'},
                'certificate_3_ar': {filesize: 'Image size must be less than 300 kb'},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }
    return true;
}

function chairmansMessageValidation() {
    const mainConfigForm = $('#edit_chairmans_message');
    if (mainConfigForm.length > 0) {
        let $validator;
        $validator = mainConfigForm.validate({
            rules: {
                // 'name_en': {required: true, maxlength: 30},
                // 'name_ar': {required: true, maxlength: 30},
                'summary_en': {required: true, maxlength: 2000},
                'summary_ar': {required: true, maxlength: 2000},
                'brief_en': {required: true, maxlength: 157},
                'brief_ar': {required: true, maxlength: 157},
                'upload_en': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                },
                'upload_ar': {
                    accept: 'image/jpg,image/jpeg,image/png',
                    filesize: 1024 * 1024 * .300
                }
            },
            messages: {
                'upload_en': {filesize: 'Image size must be less than 300 kb'},
                'upload_ar': {filesize: 'Image size must be less than 300 kb'},
            },
            highlight: validatorHighlight,
            success: validatorSuccess
        });
        if (!mainConfigForm.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }


}

function charsOnly(evt) {
    var theEvent = evt || window.event
    var key = theEvent.keyCode || theEvent.which
    key = String.fromCharCode(key)
    var regex = /[a-zA-Zء-ي 0-9 \-]|\+/;
    if (!regex.test(key)) {
        theEvent.returnValue = false
        if (theEvent.preventDefault) theEvent.preventDefault()
    }
}
