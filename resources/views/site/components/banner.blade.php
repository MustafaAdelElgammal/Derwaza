<?php
if (Request::segment(2) == 'about') {
    $text = trans('web.About');
    $img_url = '../../../../public/web/img/about_us.jpg';
} elseif (Request::segment(2) == 'contact') {
    $text = trans('web.Contact');
    $img_url = '../../../../public/web/img/contact_us.jpg';
} elseif (Request::segment(2) == 'news') {
    $text = trans('web.Our_news');
    $img_url = '../../../../public/web/img/news.jpg';
} elseif (Request::segment(2) == 'sectors') {
    $text = trans('web.Our_sector');
    $img_url = '../../../../public/web/img/sectors.jpg';
}
?>
<section class="banner_area" style="background: url({{$img_url}}) no-repeat scroll center center;">
    <div class="container">
        <div class="banner_inner_content">
            <a> @lang('web.Home')</a>
            <span>/</span>
            {{--<a class="not-clickable">{{$text}}</a>--}}
            {{--<span>/</span>--}}
            <h2>{{$text}}</h2>
        </div>
    </div>
</section>