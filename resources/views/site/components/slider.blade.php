
@if(count($sliders) > 0)
<section class="main_slider_area">
    <div class="rev_slider"  data-version="5.0" id="home-slider">
        <ul>
            @foreach($sliders as $slider)
                @php $slider = $slider->postByLang; @endphp
            <li data-slotamount="7" data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="600" data-rotate="0" data-saveperformance="off">
                <!-- MAIN IMAGE -->
                <img src="{{$up . '/posts/slider/' . $slider->upload}}"  alt="{{$slider->name}}"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                <!-- LAYERS -->
            </li>
            @endforeach
        </ul>
    </div><!-- END REVOLUTION SLIDER -->
</section>
@endif