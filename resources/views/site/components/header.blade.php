<div class="first_header">
    <div class="container">
        <div class="row">
        <div class="pull-right">
            <ul class="header_social">
                <li class="hide_icon">
                    @if($lang == 'ar')
                        <a class="hide_icon language_font" href="{{url('/changeLanguage/en')}}">English</a>
                    @else
                        <a class="hide_icon language_font" href="{{url('/changeLanguage/ar')}}">العربية</a>
                    @endif
                </li>
            </ul>
            <div class="contact_details">
                <div class="media">
                    <div class="media-left">
                        <i class="mdi mdi-phone"></i>
                    </div>
                    <div class="media-body">
                        <h4>{{trim($config->main->site_phone)}}</h4>
                    </div>
                </div>
                <div class="media">
                    <div class="media-left">
                        <i class="mdi mdi-email"></i>
                    </div>
                    <div class="media-body">
                        <h4>{{trim($config->main->site_email)}}</h4>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
<div class="main_menu_area menu_full_width">
    <nav class="navbar navbar-default">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#navbar" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                @if($lang=='ar')
                    <a class="navbar-brand" href="{{url($lang.'/')}}"><img src="{{$img}}/D_Logo.png" alt=""></a>
                @else
                    <a class="navbar-brand" href="{{url($lang.'/')}}"><img src="{{$img}}/D_Logo_EN_100px.png" alt=""></a>
                @endif
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="@if(Request::segment(2) == '') active @endif" >
                        <a href="{{url('/'.$lang.'/')}}" class="">@lang('web.Home')</a>
                    </li>
                    <li class="@if(Request::segment(2) == 'sectors') active @endif">
                        <a href="{{url('/'.$lang.'/sectors')}}" class="">@lang('web.Sectors')</a>
                    </li>
                    {{--<li class="@if(Request::segment(2) == 'news') active @endif">--}}
                        {{--<a href="{{url('/'.$lang.'/news')}}" class="">@lang('web.News')</a>--}}
                    {{--</li>--}}
                    <li class="@if(Request::segment(2) == 'about') active @endif">
                        <a href="{{url('/'.$lang.'/about')}}">@lang('web.About')</a>
                    </li>
                    <li class="@if(Request::segment(2) == 'contact') active @endif">
                        <a href="{{url('/'.$lang.'/contact')}}">@lang('web.Contact')</a>
                    </li>

                    @if($lang == 'ar')
                        <li class="nav-item lang-link">
                        <a class="nav-link" href="{{url('/changeLanguage/en')}}">English</a>
                        </li>
                        @else
                        <li class="nav-item lang-link">
                        <a class="nav-link" href="{{url('/changeLanguage/ar')}}">العربية</a>
                        </li>
                    @endif

                </ul>
            </div>
        </div>
    </nav>
</div>

