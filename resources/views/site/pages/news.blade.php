@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}}| @lang('web.News')</title>
    <meta name="description" content="{{$config->site_desc}}">
    <meta name="keywords" content="{{$config->site_keyword}}">
@endsection
@section('header_down')
    @include('site.components.banner')
@endsection
@section('content')
    <section class="latest_news_s2 padding-top">
        <div class="container">
            <div class="row">
                @foreach($news as $new)
                    <div class="col-md-6">
                        <div class="l_news_s2_item">
                            <div class="media">
                                <div class="media-left">
                                    <div class="date_news">
                                        <h3>{{$new->created_at->format('j')}}</h3>
                                        <h5> <?php $month = $new->created_at->format('F'); echo trans('web.' . $month)?> </h5>
                                    </div>
                                    <div class="news_year">
                                        <h4>{{$new->created_at->format('Y')}}</h4>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <h4>{{$new->postByLang->name}}</h4>
                                    <p>{{$new->postByLang->other_inputs_values->brief}}</p>
                                </div>
                                <a class="readMore"
                                   href="{{url($lang . '/news/'.$new->postByLang->slug)}}">@lang('web.read_more')</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="row load-more-news">
                <div class="col-md-12 ">{{$news->links()}}</div>
            </div>
        </div>
    </section>
@endsection
{{--@foreach($news as $new)--}}
{{--<div class="col-md-6">--}}
{{--<div class="blog_zig_content_left">--}}
{{--<h5>Posted <span>{{$new->created_at->format('j F Y')}}</span> by <span>{{$new->postByLang->name}}</span></h5>--}}
{{--<h4 style="color: red;">{{$new->postByLang->other_inputs_values->title}}</h4>--}}
{{--<h4>{{$new->postByLang->other_inputs_values->brief}}</h4>--}}
{{--                        <p>{!! $new->postByLang->short !!}</p>--}}
{{--<a class="readmore_btn balck_btn" href="{{url($lang . '/news/'.$new->postByLang->slug)}}">Read more</a>--}}
{{--</div>--}}
{{--</div>--}}
{{--@endforeach--}}