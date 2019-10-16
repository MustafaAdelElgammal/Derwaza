@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}}</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="keywords" content="{{$config->site_keyword}}">
@endsection
@section('header_down')
    {{--    @foreach($sectors as $sector)--}}
    @php
        $text = 'Our Sectors' ;
        $img_url=$img.'/sectors.jpg';
    @endphp
    <section class="banner_area" style="background: url({{$img_url}}) no-repeat scroll center center;">
        <div class="container">
            <div class="banner_inner_content">
                <a> @lang('web.Home')</a>
                <span>/</span>
                <a class="not-clickable">@lang('web.Sectors')</a>
                <span>/</span>
                <h3><p class="text_center">{{strip_tags($sector->name)}}</p></h3>
            </div>
        </div>
    </section>
    {{--@endforeach--}}
@endsection
@section('content')
    <section class="service_details_area">
        <div class="container">
        @if($lang == 'ar')
            <div class="row">
                    @include('site.components.sidebar')
                    <div class="col-md-9 pull-right">
                        <div class="service_details_inner">
                            <div class="service_image_single">
                                <img class="img-responsive" src="{{$up . '/posts/sectors/' . $sector->upload}}"
                                     alt="{{$sector->name}}">
                                <h5>{{strip_tags($sector->other_inputs_values->brief)}}</h5>
                            </div>
                            <div class="service_2column">
                                <div class="media">
                                    @if($sector->other_inputs_values->secondary_img != null)
                                        <div class="media-left">
                                            <img class="sectorimg-main"
                                                 src="{{$up . '/posts/sectors/' . $sector->other_inputs_values->secondary_img}}"
                                                 alt="{{strip_tags($sector->name)}}">
                                        </div>
                                    @endif
                                    <div class="media-body">
                                        {!! $sector->short !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        @else
            <div class="row">
                <div class="col-md-9 pull-right">
                    <div class="service_details_inner">
                        <div class="service_image_single">
                            <img class="img-responsive" src="{{$up . '/posts/sectors/' . $sector->upload}}"
                                 alt="{{$sector->name}}">
                            <h5 class="lineheight">{{strip_tags($sector->other_inputs_values->brief)}} </h5>
                        </div>
                        <div class="service_2column">
                            <div class="media">
                                @if($sector->other_inputs_values->secondary_img != null)
                                    <div class="media-left">
                                        <img class="sectorimg-main"
                                             src="{{$up . '/posts/sectors/' . $sector->other_inputs_values->secondary_img}}"
                                             alt="{{strip_tags($sector->name)}}">
                                    </div>
                                @endif
                                <div class="media-body">
                                    <div>
                                        {!! $sector->short !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="service_2column">
                            <div class="media">
                                <div class="media-left">
                                </div>
                                <div class="media-body">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                @include('site.components.sidebar')
            </div>
        @endif
        </div>
    </section>
    {{--    @include('site.components.sectors')--}}
@endsection

