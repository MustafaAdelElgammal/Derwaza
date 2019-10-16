@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}}</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="author" content="{{$config->site_name}}">
@endsection
@section('content')
    @include('site.components.slider')
    @include('site.components.chairmans_message')
    @include('site.components.sectors')
{{--    @include('site.components.news')--}}
    @include('site.components.clients')
    @include('site.components.contact-black')
    @include('site.components.map')
@endsection
