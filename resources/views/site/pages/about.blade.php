@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}} | @lang('web.About')</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="keywords" content="{{$config->site_keyword}}">
@endsection
@section('content')
    @include('site.components.banner')
    <!--================Company express2 Area =================-->
    <section class="blog_details_area">
        <div class="container">
            @foreach($chairmans_message as $message)
                @php $message = $message->postByLang; @endphp
            <div class="blog_column_2">
                <div class="row">
                    <div class="col-md-4">
                        <img class="img-seo-width" src="{{$up . '/posts/chairmans_message/' . $message->upload}}" alt="">
                    </div>
                    <div class="col-md-8">
                        <div class="blog_column_content">
                            <p>{{$message->other_inputs_values->summary}}</p>
                            <p><h6 class="seo-sign"><span>{{$message->name}}</span> - @lang('web.CEO_Founder')</h6></p>
                        </div>
                    </div>
                </div>
            </div>
             @endforeach
        </div>
    </section>
    <section class="project_count_area">
        <div class="container">
            <div class="row mission_s_inner">
                @foreach($missions as $mission)
                    @php $mission = $mission->postByLang; @endphp
                    <div class="col-md-6">
                        <div class="mission_s_item">
                            <div class="media">
                                <div class="media-left">
                                    @if($lang == 'ar')
                                        <img class="left_img" src="{{$img}}/title-right-bar.png" alt="">
                                    @else
                                        <img  class="left_img"  src="{{$img}}/title-left-bar.png" alt="">
                                    @endif
                                </div>
                                <div class="media-body">
                                    <h4>@lang('web.Mission')</h4>
                                    <p>{!!  $mission->other_inputs_values->our_mission !!}</p></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mission_s_item">
                            <div class="media">
                                <div class="media-left">
                                    @if($lang == 'ar')
                                        <img class="left_img" src="{{$img}}/title-right-bar.png" alt="">
                                    @else
                                        <img class="left_img" src="{{$img}}/title-left-bar.png" alt="">
                                    @endif                                </div>
                                <div class="media-body">
                                    <h4>@lang('web.Vission')</h4>
                                    <p>{!! $mission->other_inputs_values->our_vission !!} </p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    @foreach($certificates as $certificate)
        <div class="team_item">
            <div class="main_title"><h2><img class="left_img" src="{{$img}}/title-left-bar.png" alt="">@lang('web.Certificates')<img class="right_img" src="{{$img}}/title-right-bar.png" alt=""></h2>
                <p class="text-style">{!! $certificate->postByLang->other_inputs_values->brief !!}</p>
            </div>
            <div class="col-md-4">
                <div class="team_img">
                    <img src="{{$up . '/posts/certificates/' . $certificate->postByLang->other_inputs_values->certificate_1}}" alt="">
                </div>
            </div>
            <div class="col-md-4">
                <div class="team_img">
                    <img src="{{$up . '/posts/certificates/' . $certificate->postByLang->other_inputs_values->certificate_2}}" alt="">
                </div>
            </div>
            <div class="col-md-4">
                <div class="team_img">
                    <img src="{{$up . '/posts/certificates/' . $certificate->postByLang->other_inputs_values->certificate_3}}" alt="">
                </div>
            </div>
        </div>

    @endforeach
    <section class="image_area">
        <div class="main_title">
            <h2 class="lineMargin">
                <img class="left_img" src="{{$img}}/title-left-bar.png" alt="">
                @lang('web.Organization_chart')
                <img class="right_img" src="{{$img}}/title-right-bar.png" alt="">
            </h2>
        </div>
        @foreach($organization_chart as $chart)
            <img src="{{$up . '/posts/organization_chart/' . $chart->postByLang->upload}}" alt="">
        @endforeach
    </section>
@endsection
