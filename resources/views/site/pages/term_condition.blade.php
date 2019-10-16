@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}} | @lang('web.terms')</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="keywords" content="{{$config->site_keyword}}">
@endsection
@section('header_down')
    <div class="bread-crumb">
        <div class="container">
            <div class="matter">
                <h2>@lang('web.terms')</h2>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="{{url('/')}}">@lang('web.home')</a></li>
                    <li class="list-inline-item"><a href="#">@lang('web.terms')</a></li>
                </ul>
            </div>
        </div>
    </div>
@endsection
@section('content')
    <div class="shop">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div>{!! $post->details !!}</div>
                </div>
            </div>
        </div>
    </div>
@endsection