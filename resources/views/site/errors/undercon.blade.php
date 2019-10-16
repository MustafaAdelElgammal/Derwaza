{{--<!DOCTYPE html>--}}
{{--<!--[if lt IE 7 ]>--}}
{{--<html class="ie ie6" lang="en"> <![endif]-->--}}
{{--<!--[if IE 7 ]>--}}
{{--<html class="ie ie7" lang="en"> <![endif]-->--}}
{{--<!--[if IE 8 ]>--}}
{{--<html class="ie ie8" lang="en"> <![endif]-->--}}
{{--<!--[if (gte IE 9)|!(IE)]><!-->--}}
{{--<html lang="en"> <!--<![endif]-->--}}
{{--<head>--}}
    {{--<meta charset="utf-8">--}}
    {{--@yield('meta')--}}
    {{--<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>--}}
    {{--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--}}
    {{--<meta name="viewport" content="width=device-width, initial-scale=1.0">--}}
    {{--<meta name="theme-color" content="#85c435">--}}
    {{--<link rel="shortcut icon" href="{{$img}}/D_Brand_Logo.png">--}}
    {{--{{ Html::style($css   . '/bootstrap.min.css') }}--}}
    {{--{{ Html::style($css   . '/main_en.css') }}--}}
    {{--@if($lang == 'ar')--}}
         {{--{{ Html::style($css   . '/bootstrap.rtl.min.css') }}--}}
         {{--{{ Html::style($css   . '/main_ar.css') }}--}}
    {{--@endif--}}
    {{--{{ Html::style($css   . '/skin-default.css') }}--}}
    {{--{{ Html::style($fonts . '/icofont/css/icofont.css') }}--}}
    {{--{{ Html::style($js    . '/owlcarousel2/assets/owl.carousel.min.css') }}--}}
    {{--{{ Html::style($js    . '/mb.YTPlayer/css/jquery.mb.YTPlayer.min.css') }}--}}
{{--<!--[if lt IE 9]>--}}
    {{--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>--}}
    {{--<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--}}
    {{--<![endif]-->--}}
{{--</head>--}}
{{--<body>--}}
{{--<div class="wrapper">--}}
    {{--<div class="page-not-found">--}}
        {{--<div class="container">--}}
            {{--<div class="row" style="text-align: center;">--}}

                {{--<!-- Title Content Start -->--}}
                {{--<div class="col-sm-12 col-xs-12 commontop text-center" style="margin-top: 218px">--}}
                    {{--<img src="{{$img}}/D_Logo.png" alt="">--}}

                    {{--<h4 style="font-size: 90px">COMING SOON</h4>--}}
                    {{--<div class="divider style-1 center">--}}
                        {{--<img class="left_img" src="{{$img}}/title-right-bar.png" alt="">--}}
                        {{--<i class="icofont icofont-ui-press hr-icon"></i>--}}
                        {{--<img  class="left_img"  src="{{$img}}/title-left-bar.png" alt="">--}}
                    {{--</div>--}}

                {{--</div>--}}
                {{--<!-- Title Content End -->--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
{{--</body>--}}
{{--</html>--}}

        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="img/express-favicon.png" type="image/x-icon" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Express A Logistics Company</title>

    <!-- Icon css link -->
    <link href="{{$vendors}}/material-icon/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="{{$css}}/font-awesome.min.css" rel="stylesheet">
    <link href="{{$vendors}}/linears-icon/style.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="{{$css}}/bootstrap.min.css" rel="stylesheet">

    <!-- Rev slider css -->
    <link href="{{$vendors}}/revolution/css/settings.css" rel="stylesheet">
    <link href="{{$vendors}}/revolution/css/layers.css" rel="stylesheet">
    <link href="{{$vendors}}/revolution/css/navigation.css" rel="stylesheet">

    <!-- Extra plugin css -->
    <link href="{{$vendors}}/bootstrap-selector/bootstrap-select.css" rel="stylesheet">
    <!--        <link href="vendors/countdown/countdown.demo.css" rel="stylesheet">-->

    <link href="{{$css}}/style.css" rel="stylesheet">
    <link href="{{$css}}/responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div id="preloader">
    <div id="preloader_spinner">
        <div class="sk-cube-grid">
            <div class="sk-cube sk-cube1"></div>
            <div class="sk-cube sk-cube2"></div>
            <div class="sk-cube sk-cube3"></div>
            <div class="sk-cube sk-cube4"></div>
            <div class="sk-cube sk-cube5"></div>
            <div class="sk-cube sk-cube6"></div>
            <div class="sk-cube sk-cube7"></div>
            <div class="sk-cube sk-cube8"></div>
            <div class="sk-cube sk-cube9"></div>
        </div>
    </div>
</div>


<!--================UnderConstruction Area =================-->
<section class="underconstruction_area display_table">
    <div class="row m0 display_table_row">
        <div class="left_construction display_table_cell">
            <div class="construction_content">
                <img src="{{$img}}/D_Logo_EN_100px.png" alt="">
                <div class="timer_inner">
                </div>
                <div class="news_widget_inner">
                    <aside class="left_widget contact_widget">
                    <ul>
                    <li class="text-color"><i class="mdi mdi-phone mdi-style"></i>{{$config->main->site_phone}}</li>
                    <li class="text-color"><i class="mdi mdi-email mdi-style"></i>{{$config->main->site_email}}</li>
                        <br>
                    <li>
                        @if(trim($config->social[1]['link']) != null)
                            <a href="{{$config->social[1]['link']}}" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        @endif
                        @if(trim($config->social[2]['link']) != null)
                            <a href="{{$config->social[2]['link']}}" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        @endif
                        @if(trim($config->social[3]['link']) != null)
                            <a href="{{$config->social[3]['link']}}" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        @endif
                    </li>
                </ul>
                    </aside>
                </div>
            </div>
        </div>
        <div class="right_construction display_table_cell">
            <img src="{{$img}}/undercontruction.jpg" alt="">
            <div class="construction_right_content">
                <h4>Welcome to Darwaza</h4>
                <h4>we are coming soon</h4>
            </div>
        </div>
    </div>
</section>
<!--================End UnderConstruction Area =================-->



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="{{$js}}/jquery-2.1.4.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="{{$js}}/bootstrap.min.js"></script>
<!-- Extra plugin js -->
<script src="{{$vendors}}/bootstrap-selector/bootstrap-select.js"></script>
<script src="{{$vendors}}/counter-up/waypoints.min.js"></script>
<script src="{{$vendors}}/counter-up/jquery.counterup.min.js"></script>
<script src="{{$vendors}}/countdown/jquery.countdown.min.js"></script>
<script src="{{$vendors}}/countdown/jquery.countdown.min.js"></script>


<script src="{{$js}}/theme.js"></script>
</body>
</html>