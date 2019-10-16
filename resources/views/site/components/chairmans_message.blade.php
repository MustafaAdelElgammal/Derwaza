<!--================ Chairman's Message Area =================-->
<section class="about_history_area">
    <div class="container">
        <div class="row">
            @foreach($chairmans_message as $message)
                @php $message = $message->postByLang; @endphp
                <div class="col-md-4">
                    <div class="history_details">
                        <p>{{$message->other_inputs_values->summary}}</p>
                        <h5><span>{{$message->name}}</span> - @lang('web.CEO_Founder')</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="company_history">
                        @if($lang == 'en')
                            <h3>@lang('web.Derwaza')</h3>
                            <h5>@lang('web.Logistics') services</h5>
                        @endif
                        @if($lang == 'ar')
                                <h3>@lang('web.Derwaza')</h3>
                            <h5>@lang('web.Company') @lang('web.Logistics')</h5>
                        @endif
                        <img src="{{$up . '/posts/chairmans_message/' . $message->upload}}" alt="">
                    </div>
                </div>
            @endforeach
            @foreach($missions as $mission)
                @php $mission = $mission->postByLang; @endphp
                <div class="col-md-5 col-xs-12">
                    <div class="experience_box">
                        <div class="bg_box">
                            <div class="content_box">
                                <h4>@lang('web.Mission')</h4>
                            </div>
                        </div>
                        <div class="count_area">
                            <div class="item">
                                <h4>{{$mission->other_inputs_values->our_mission}}</h4>
                            </div>
                        </div>
                    </div>
                    <div class="experience_box ex_center">
                        <div class="bg_box">
                            <div class="content_box">
                                <h4>@lang('web.Vission') </h4>
                            </div>
                        </div>
                        <div class="count_area">
                            <div class="item">
                                <h4>{{$mission->other_inputs_values->our_vission}}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
<!--================ End About History Area =================-->
