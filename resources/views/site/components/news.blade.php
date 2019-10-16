@if(count($news) > 0)
<section class="latest_news_s2 news_small">
    <div class="container">
        <div class="main_title">
            <h2>
                <img class="left_img" src="{{$img}}/title-left-bar.png" alt="News Slider">
                @lang('web.Last_News')
                <img class="right_img" src="{{$img}}/title-right-bar.png" alt="News Slider"></h2>
        </div>
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
        @if(count($news) > 4)
        <div class="row load-more-news">
            <div class="col-md-12 ">@lang('web.More_news') <a href="{{url('/'.$lang.'/news')}}">@lang('web.here')...</a></div>
        </div>
         @endif
    </div>
</section>
@endif

