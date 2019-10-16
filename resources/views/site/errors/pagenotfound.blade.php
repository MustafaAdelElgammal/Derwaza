@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}}</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="keywords" content="{{$config->site_keyword}}">
@endsection
@section('header_down')
    <!-- Breadcrumb Start -->
    <div class="bread-crumb">
        <div class="container">
            <div class="matter">
                <h2>Page Not Found</h2>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="index.html">HOME</a></li>
                    <li class="list-inline-item"><a href="#">Page not found</a></li>
                </ul>
            </div>
        </div>
    </div>
@endsection
@section('content')

    <!-- Breadcrumb End -->


    <!-- Service Start  -->
    <div class="page-not-found">
        <div class="container">
            <div class="row ">
                <div class="col-sm-12 col-xs-12">

                </div>

                <!-- Title Content Start -->
                <div class="col-sm-12 col-xs-12 commontop text-center">
                    <h4>Page not found!</h4>
                    <div class="divider style-1 center">
                        <span class="hr-simple left"></span>
                        <i class="icofont icofont-ui-press hr-icon"></i>
                        <span class="hr-simple right"></span>
                    </div>
                    <div class="error-content">
                        <h2>404</h2>
                        <h3>Oops! Looks like something going rong</h3>
                        <p>We can’t seem to find the page you’re looking for make sure that you have typed the currect URL</p>
                        <a class="btn btn-theme btn-wide" href="index.html">Go to home</a>
                    </div>
                </div>
                <!-- Title Content End -->

            </div>
        </div>
    </div>
    <!-- Service End   -->
@endsection
