<!DOCTYPE html>
<!--[if lt IE 7 ]>
<html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>
<html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>
<html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    @yield('meta')
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <link rel="shortcut icon" href="{{$img}}/D_Brand_Logo.png">
    <title> {{$config->site_name}}</title>
    <link href="{{$vendors}}/material-icon/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="{{$vendors}}/linears-icon/style.css" rel="stylesheet">
    <!-- Bootstrap -->
    {{ Html::style($css   . '/font-awesome.min.css') }}
    {{Html::style($css  . '/bootstrap.min.css')}}

    @if($lang == 'ar')
        {{Html::style($css  . '/bootstrap-rtl.css')}}
    @endif
    {{--{{ Html::style($css   . '/bootstrap.min.css') }}--}}
<!-- Rev slider css -->
    <link href="{{$vendors}}/revolution/css/settings.css" rel="stylesheet">
    <link href="{{$vendors}}/revolution/css/layers.css" rel="stylesheet">
    <link href="{{$vendors}}/revolution/css/navigation.css" rel="stylesheet">
    <link href="{{$vendors}}/animate-css/animate.css" rel="stylesheet">
    <link href="{{$vendors}}/bootstrap-selector/bootstrap-select.css" rel="stylesheet">
    {{--    {{ Html::style($css   . '/style.css') }}--}}
    {{ Html::style($css   . '/style.css') }}
    @if($lang == 'en')
        <?php $direction = 'ltr';?>
    @else
        {{Html::style($css  . '/style-ar.css')}}
        <?php $direction = 'rtl';?>
    @endif
    {{ Html::style($css   . '/responsive.css') }}


</head>
<body class="{{$direction}}">
{{--<div id="preloader">--}}
    {{--<div id="preloader_spinner">--}}
        {{--<div class="sk-cube-grid">--}}
            {{--<div class="sk-cube sk-cube1"></div>--}}
            {{--<div class="sk-cube sk-cube2"></div>--}}
            {{--<div class="sk-cube sk-cube3"></div>--}}
            {{--<div class="sk-cube sk-cube4"></div>--}}
            {{--<div class="sk-cube sk-cube5"></div>--}}
            {{--<div class="sk-cube sk-cube6"></div>--}}
            {{--<div class="sk-cube sk-cube7"></div>--}}
            {{--<div class="sk-cube sk-cube8"></div>--}}
            {{--<div class="sk-cube sk-cube9"></div>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
@include('site.components.header')
@yield('header_down')
@yield('content')
@include('site.components.footer')
{{--<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->--}}
<script src="{{ $js }}/jquery-2.1.4.min.js"></script>
<script src="{{ $js }}/bootstrap.min.js"></script>
<!-- Rev slider js -->
<script src="{{$vendors}}/revolution/js/jquery.themepunch.tools.min.js"></script>
<script src="{{$vendors}}/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script src="{{$vendors}}/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script src="{{$vendors}}/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script src="{{$vendors}}/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="{{$vendors}}/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script src="{{$vendors}}/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<!-- Extra plugin js -->
{{Html::script($js . '/jquery.validate.min.js')}}
<script src="{{$vendors}}/bootstrap-selector/bootstrap-select.js"></script>
<script src="{{$vendors}}/counter-up/waypoints.min.js"></script>
<script src="{{$vendors}}/counter-up/jquery.counterup.min.js"></script>
<script src="{{$vendors}}/countdown/jquery.countdown.min.js"></script>
<!--gmaps Js-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="{{ $js }}/gmaps.min.js"></script>
<script src="{{ $js }}/menu-fixed.js"></script>
<script src="{{ $js }}/theme.js"></script>

{{Html::script($js . '/scripts.js')}}

@if($lang == 'ar')
    {{Html::script($js . '/messages_ar.js')}}
@endif
{{Html::script($js . '/messages_en.js')}}

@yield('js')
</body>
</html>

