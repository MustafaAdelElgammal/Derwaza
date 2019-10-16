<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>@yield('title', trans('admin.admin_area') )</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-touch-fullscreen" content="yes">
        <link rel="shortcut icon" href="/{{config('constants.optAdmin.img')}}/D_Brand_Logo.png">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        {{Html::style(config('constants.optAdmin.css')  . '/jquery.tagsinput.min.css')}}
        {{Html::style(config('constants.optAdmin.css')  . '/jasny-bootstrap.css' )}}
        {{Html::style(config('constants.optAdmin.css')  . '/perfect-scrollbar.css' )}}
        {{Html::style(config('constants.optAdmin.css')  . '/summernote.css' )}}
        {{Html::style(config('constants.optAdmin.css')  . '/dropzone.css')}}
        {{Html::style(config('constants.optAdmin.css')  . '/select2.min.css')}}
        {{Html::style(config('constants.optAdmin.css')  . '/bootstrap-timepicker.min.css')}}
        {{Html::style(config('constants.optAdmin.css')  . '/jquery.tagsinput.min.css')}}
        {{Html::style(config('constants.optAdmin.js')   . '/multiselect-master/style.css')}}
        {{Html::style(config('constants.optAdmin.css')  . '/jquery.gritter.css')}}
        {{Html::style(config('constants.optAdmin.css')  . '/style.default-' . $lang . '.css' )}}
        {{Html::style(config('constants.optAdmin.css')  . '/jquery.weekLine.css')}}
        @yield('css')
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="stickyheader">
        <div id="preloader">
            <div id="status">
                <i class="fa fa-spinner fa-spin"></i>
            </div>
        </div>
        <section>
            <div id="leftpanel" class="leftpanel sticky-leftpanel">
                @include('admin.partials.side_menu')
            </div>
            <div class="mainpanel">
                @include('admin.partials.top_nav')
                <div id="content-inner">@yield('content')</div>
            </div>
        </section>
        {{Html::script(config('constants.optAdmin.js') . '/jquery.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/moment.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery-migrate-1.2.1.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/bootstrap.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/modernizr.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/material.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/retina.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/nprogress.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery-ui-1.10.3.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/fullcalendar.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.sparkline.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.fullscreen.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/perfect-scrollbar.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.gritter.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/bootstrap-wizard.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jasny-bootstrap.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/summernote.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/summernote-trans-'.$lang.'.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/dropzone.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/sortable.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/multiselect-master/multiselect.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/toggles.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.weekLine.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/chosen.jquery.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.tagsinput.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/bootstrap-timepicker.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.validate.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/additional-methods.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.validate.extends.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/messages_'.$lang.'.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/select2.min.js')}}
        @yield('js')
        {{Html::script(config('constants.optAdmin.js') . '/admin.js')}}
    </body>
</html>