<div class="col-md-3 pull-left">
    <div class="service_left_sidebar">
        <aside class="left_widget service_widget">
            <div class="widget_title">
                <h3>@lang('web.Sectors')</h3>
            </div>
            <ul>
                @foreach($sectors as $sector)
                    <li>
                        <a class="@if(urldecode(Request::segment(3)) == $sector->postByLang->slug) sector-active @endif"
                           href="{{url($lang . '/sectors/'.$sector->postByLang->slug)}}">
                            <p>
                                {{str_limit($sector->postByLang->name, 35)}}
                            </p>
                        </a>
                    </li>
                @endforeach
            </ul>
        </aside>
        <aside class="left_widget contact_widget">
            <div class="widget_title">
                <h3>@lang('web.Contact')</h3>
            </div>
            {{--@foreach($contacts as $contact)--}}
            {{--@endforeach--}}
            <ul>
                {{--@foreach($contacts as $contact)--}}
                    {{--<li><a class="not-clickable">--}}
                            {{--<i class="mdi mdi-map-marker"></i></a>{!! $contact->postByLang->name !!}</li>--}}
                {{--@endforeach--}}
                @if(trim($config->main->site_phone) != null)
                    <li><a class="not-clickable"><i class="mdi mdi-phone"></i></a>{{$config->main->site_phone}}</li>
                @endif
                @if(trim($config->main->site_email) != null)
                    <li><a class="not-clickable"><i class="mdi mdi-email"></i></a>{{$config->main->site_email}}</li>
                @endif

            </ul>
        </aside>
    </div>
</div>