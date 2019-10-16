@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}}</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="keywords" content="{{$config->site_keyword}}">
@endsection
@section('header_down')
    <section class="banner_area" style="background: url('../../../../public/web/img/news.jpg') no-repeat scroll center center;">
        <div class="container">
            <div class="banner_inner_content">
                <a>Home</a>
                <span>/</span>
                {{--<a class="active" href="blog.html">{{$text}}</a>--}}
                <a>@lang('web.News')</a>
                <span>/</span>
                <h2>@lang('web.News_Details')</h2>
            </div>
        </div>
    </section>
    @endsection
@section('content')

    <section class="blog_details_area">
        <div class="container">
            <div class="blog_details_content">
                <h3>{!! $new->name !!} </h3>
                <h4>{{$new->postConfig->created_at->format('j F Y')}}</h4>
                <h5>{!! $new->other_inputs_values->brief !!}</h5>
                {!! $new->short !!}
            </div>
        </div>
    </section>
@endsection