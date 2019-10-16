<footer class="footer_area">
    <div class="footer_widgets_area">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="f_widgets about_widget">
                        <div class="f_title">
                            <h3 class="arabic-design">@lang('web.About_company')</h3>
                        </div>
                        <div class="about_widget_inner">
                            @if($lang == 'ar')
                            <img class="footerimg" src="{{$img}}/Darwaza_Logo_AR_1.png" alt="{{$config->site_name}}">
                                @else
                                <img class="footerimg" src="{{$img}}/Darwaza_Logo_EN_1.png" alt="{{$config->site_name}}">
                            @endif
                            @foreach($chairmans_message as $message)
                                <p>
                                    {!! $message->postByLang->other_inputs_values->brief !!}
                                </p>
                            @endforeach
                        </div>
                    </div>
                </div>
                {{--<div class="col-md-5">--}}
                    {{--<div class="f_widgets about_widget">--}}
                        {{--<div class="about_widget_inner">--}}
                            {{--<img class="footerimg" src="{{$img}}/D_Logo.png" alt="">--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
                <div class="col-md-3 align-center">
                    <div class="f_widgets link_widget">
                        <div class="f_title">
                            <h3 class="arabic-design">@lang('web.useful_links')</h3>
                        </div>
                        <ul class="link_widget_inner">
                            <li><a href="{{url('/'.$lang.'/about')}}">@lang('web.About')</a></li>
                            <li><a href="{{url('/'.$lang.'/contact')}}">@lang('web.Contact')</a></li>
                            <li><a href="{{url('/'.$lang.'/sectors')}}">@lang('web.Sectors')</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="f_widgets news_widget">
                        <div class="f_title">
                            <h3 class="arabic-design">@lang('web.Contact')</h3>
                        </div>
                        @foreach($chairmans_message as $message)
                        <div class="news_widget_inner">
                            <aside class="left_widget contact_widget">

                            <ul>
                                <li class="text-color"><i class="mdi mdi-phone mdi-style"></i>{{$config->main->site_phone}}</li>
                                <li class="text-color"><i class="mdi mdi-email mdi-style"></i>{{$config->main->site_email}}</li>

                            </ul>
                            </aside>
                        </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copy_right_area">
        <h4>@lang('web.copyrights') <a href="http://www.interteleco.com" target="_blank" style="color: #82cffd !important;">@lang('web.interteleco')</a></h4>
    </div>
</footer>

