<section class="get_area">
    <div class="container">

        <div class="main_title ">
            <h2 class="lineMargin contact_title">
                <img class="left_img" src="{{$img}}/title-left-bar-white.png" alt="">  @lang('web.Contact')  <img
                        class="right_img" src="{{$img}}/title-right-bar-white.png" alt="">
            </h2>
        </div>
        <div class="row contact_area_form">
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

            <form action="{{url('/contact')}}" method="post" id="contactForm" class="contactForm form-width" onsubmit="return mainValidation() ">
                {{csrf_field()}}
                <div class="form-group col-md-6">
                    <input type="text" class="form-control" id="full_name" name="full_name"
                           placeholder="@lang('web.Full_name')" maxlength="50">
                </div>
                <div class="form-group col-md-6">
                    <input type="email" class="form-control" id="email" name="email"
                           placeholder="@lang('web.Email')">
                </div>
                <div class="form-group col-md-12">
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
</section>
