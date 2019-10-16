@if(count($sectors) > 0)
@if(count($sectors) > 1)
<section id="sectors" class="services_area ">
        <div class="main_title">
            <h2 class="lineMargin">
                <img class="left_img" src="{{$img}}/title-left-bar.png" alt="">@lang('web.Our_sector')
                <img class="left_img" src="{{$img}}/title-right-bar.png" alt=""></h2>
        </div>
        <div class="services_inner background-color">
            @foreach($sectors as $sector)
                @php $sector = $sector->postByLang; @endphp
                <div class="service_item">
                    <img class="sectorsmin" src="{{$up . '/posts/sectors/' . $sector->upload}}" alt="{{$sector->name}}">
                    <div class="services_hover">
                        <h4> {{$sector->name}}</h4>
                        <a class="readmore_btn" href="{{url($lang . '/sectors/'.$sector->slug)}}">@lang('web.read_more')</a>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
@endif
@if(count($sectors) == 1)
    <section id="sectors" class="services_area ">
        <div class="main_title">
            <h2 class="lineMargin">
                <img class="left_img" src="{{$img}}/title-left-bar.png" alt="">@lang('web.Our_sector')
                <img class="left_img" src="{{$img}}/title-right-bar.png" alt=""></h2>
        </div>
        <div class="services_inner background-color">
            @foreach($sectors as $sector)
                @php $sector = $sector->postByLang; @endphp
                <div class="service_item service_img">
                    <img class="sectorsmin" src="{{$up . '/posts/sectors/' . $sector->upload}}" alt="{{$sector->name}}">
                    <div class="services_hover">
                        <h4> {{$sector->name}}</h4>
                        <a class="readmore_btn" href="{{url($lang . '/sectors/'.$sector->slug)}}">@lang('web.read_more')</a>
                    </div>
                </div>
            @endforeach
        </div>
    </section>
    @endif
@endif