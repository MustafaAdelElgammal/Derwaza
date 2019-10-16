@extends('site.layout')
@section('meta')
    <title>{{$config->site_name}} | @lang('web.Contact')</title>
    <meta name="description" content="{{$config->site_desc}}">
@endsection
@section('header_down')
    @include('site.components.banner')

@endsection
@section('content')
    <!-- Title Content Start -->
    <section class="contact_form_area">
        <div class="container">
            <div class="row">
                <h1 class="padding-top">{{$headBranch->$name}}</h1>
            </div>
            <div class="row contact_details_us">
                <div class="col-md-5 col-xs-6">
                    <div class="contact_details_item">
                        <h4>@lang('web.Address')</h4>
                        <p>{!! $headBranch->{'address_'. $lang} !!} </p>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6 item_dir_left">
                    <div class="contact_details_item">
                        <h4 class="phone">@lang('web.Phone')</h4>
                        <p>
                           <span> (+965) </span><span>{!! $headBranch->phone !!},</span>
                            <?php $_phones = Helper::getAllPhonesAttribute($headBranch->phones);?>
                            @if(count($_phones)>0 )
                                @foreach($_phones as $onePhone)
                                    <span>{{ $onePhone }}{{(next($_phones)==true) ? ", " : ""}}</span>
                                @endforeach
                            @endif
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6">
                    <div class="contact_details_item">
                        <h4>@lang('web.Email')</h4>
                        <p>{{$config->main->site_email}}</p>
                        @if($headBranch->email != null)
                            <p>{!! $headBranch->email !!} </p>
                        @endif
                    </div>
                </div>
                {{--<div class="col-md-3 col-xs-6">--}}
                {{--<div class="contact_details_item">--}}
                {{--<h4>@lang('web.Other_contacts')</h4>--}}
                {{--<h5>{!! $headBranch->phones !!}</h5>--}}
                {{--</div>--}}
                {{--</div>--}}
            </div>
            <hr>
            @foreach($branches as $branch)
                <div class="row">
                    <h1 class="padding-top">{{$branch->$name}}</h1>
                </div>
                <div class="row contact_details_us">
                    <div class="col-md-5 col-xs-6">
                        <div class="contact_details_item">
                            <h4>@lang('web.Address')</h4>
                            <p>{!! $branch->{'address_'. $lang} !!} </p>

                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6 item_dir_left">
                        <div class="contact_details_item">
                            <h4>@lang('web.Phone')</h4>
                            <p>
                                <span> (+965) </span><span>{!! $branch->phone !!},</span>
                                <?php $_phones = Helper::getAllPhonesAttribute($branch->phones);?>
                                @if(count($_phones)>0 )
                                    @foreach($_phones as $onePhone)
                                        <span>{{ $onePhone }}{{(next($_phones)==true) ? ", " : ""}}</span>
                                    @endforeach
                                @endif
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <div class="contact_details_item">
                            <h4>@lang('web.Email')</h4>
                            <p>{{$config->main->site_email}}</p>
                            @if($branch->email != null)
                                <p>{!! $branch->email !!} </p>
                            @endif
                        </div>
                    </div>
                    {{--<div class="col-md-3 col-xs-6">--}}
                    {{--<div class="contact_details_item">--}}
                    {{--<h4>@lang('web.Other_contacts')</h4>--}}
                    {{--<h5> {!! $branch->phones !!} </h5>--}}
                    {{--</div>--}}
                    {{--</div>--}}
                </div>
                <hr>
            @endforeach

            <div class="row">
                <div class=" comment_area_form">
                    @if(session('flash_message_error'))
                        <div class="alert alert-danger" role="alert">
                            {{session('flash_message_error')}}
                        </div>
                    @endif
                    @if($lang == 'en')
                        @if(session('flash_message_done'))
                            <div class="alert alert-success" role="alert">
                                {{session('flash_message_done')}}
                            </div>
                        @endif
                    @else
                        @if(session('flash_message_done_ar'))
                            <div class="alert alert-success" role="alert">
                                {{session('flash_message_done_ar')}}
                            </div>
                        @endif
                    @endif
                    <form action="{{url('/contact')}}" autocomplete="off" method="post" id="contactForm"
                          class="contactForm" name="contactForm" onsubmit="return mainValidation() ">
                        {{csrf_field()}}
                        <div class="row">
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" id="full_name" name="full_name"
                                       placeholder="@lang('web.Full_name')" maxlength="50">
                            </div>
                            <div class="form-group col-md-6">
                                <input type="email" class="form-control" id="email" name="email"
                                       placeholder="@lang('web.Email')">
                            </div>
                        </div>
                        <div class="form-group col-md-12 form-message">
                            <input type="text" class="form-control" id="subject" name="subject"
                                   placeholder="@lang('web.Message')">
                        </div>
                        <div class="form-group col-md-12 button_area">
                            <button type="submit"
                                    class="btn btn_custom_blue form-control">@lang('web.Send_message')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    @include('site.components.map')
@endsection
