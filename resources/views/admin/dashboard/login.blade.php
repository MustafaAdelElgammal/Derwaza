<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>@lang('admin.admin_area')</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="description" content="">
    <link rel="shortcut icon" href="{{config('constants.optAdmin.up')}}/favicon.ico">
    {{Html::style(config('constants.optAdmin.css') . '/style.default-' . $lang . '.css' )}}
    {{Html::style(config('constants.optAdmin.css') . '/perfect-scrollbar.css' )}}
    {{Html::style(config('constants.optAdmin.css') . '/jquery.tagsinput.min.css')}}
    {{Html::style(config('constants.optAdmin.css') . '/jquery.gritter.css')}}
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
    <body class="signin">
        <div id="preloader">
            <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
        </div>
        <section>
            <div class="signinpanel">
                <div class="row">
                    <div class="col-lg-3 col-sm-2 col-xs-12"></div>

                    <div class="col-lg-6 col-sm-8 col-xs-12">
                        {{ Form::open(array('method'=>'post','url' => url('/admin/login')   )) }}
                            <h4 class="nomargin">@lang('admin.sign_in')</h4>
                            <p class="mt5 mb20">@lang('admin.access_account')</p>
                            @if($errors->first('login_error'))
                                <div class="alert alert-danger">
                                    {{$errors->first('login_error')}}
                                </div>
                            @endif
                            <div class="col-md-12">
                                {{Markup::textInputMaterial(trans('admin.user_email'),'email', $errors->first('email'))}}
                            </div>
                            <div class="col-md-12">
                                {{Markup::textInputPasswordMaterial(trans('admin.password'),'password',$errors->first('password'))}}
                            </div>
                            {{ Form::submit(trans('admin.sign_in'),array('class'=>'btn btn-default btn-block' ,'title' => 'Log in')) }}
                        {{ Form::close() }}
                    </div>
                    <div class="col-lg-3 col-sm-2 col-xs-12"></div>
                </div>
            </div>
        </section>
        {{-- {{Html::script('//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js')}} --}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery-migrate-1.2.1.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/bootstrap.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/modernizr.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/material.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/retina.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/nprogress.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.sparkline.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.fullscreen.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/perfect-scrollbar.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.gritter.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/bootstrap-wizard.min.js' )  }}
        {{Html::script(config('constants.optAdmin.js') . '/jasny-bootstrap.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/summernote.js') }}
        {{Html::script(config('constants.optAdmin.js') . '/summernote-trans-' . $lang . '.js') }}
        {{Html::script(config('constants.optAdmin.js') . '/dropzone.min.js') }}
        {{Html::script(config('constants.optAdmin.js') . '/sortable.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/toggles.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.tagsinput.min.js')}}
        {{Html::script(config('constants.optAdmin.js') . '/jquery.validate.min.js' )  }}
        <script>
            $(window).load(function() {
               // Page Preloader
                $('#status').fadeOut();
                $('#preloader').delay(50).fadeOut(function(){
                    $('body').delay(50).css({'overflow':'visible'});
               });
            });
        </script>
    </body>
</html>
