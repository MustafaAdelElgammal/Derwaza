@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}} | @lang('web.Sectors')</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="keywords" content="{{$config->site_keyword}}">
@endsection
@section('header_down')
    @include('site.components.banner')
@endsection
@section('content')
    @include('site.components.sectors')
<section class="why_chose_area">

</section>
    @include('site.components.map')
@endsection
