@extends('site.layout')
@section('content')

<!--================404 Area =================-->
<section class="error_area">
    <div class="error_inner">
        <img src="{{$img}}/D_Logo.png" alt="">
        <img src="{{$img}}/error/error-text.png" alt="">
        @if($lang == 'en')
        <h4>@lang('web.page_not_found')</h4>
        @else
            <p>@lang('web.page_not_found')</p>
        @endif
    </div>
</section>
<!--================404 Area =================-->
@endsection