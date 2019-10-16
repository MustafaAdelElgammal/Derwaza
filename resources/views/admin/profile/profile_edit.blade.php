@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-user"></i> @lang('admin.account_settings')</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                    <h4 class="panel-title">@lang('admin.account_information')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::model($user, array('url' => array('admin/profile/save_profile'),'method'=> 'post','class' => 'submit-ajax')) }}
                        <div class="col-md-6">
                            {{Markup::imageFileInput("", 'avatar', !empty($user) ? 'avatar/300_300_'.$user->avatar : false,'200px','200px')}}
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-12">
                                {{Markup::textInputMaterial(trans('admin.first_name'),'first_name',null,$errors->first('first_name'))}}
                            </div>
                            <div class="col-md-12">
                                {{Markup::textInputMaterial(trans('admin.last_name'),'last_name',null,$errors->first('last_name'))}}
                            </div>
                            <div class="col-md-12">
                                {{Markup::selectOptionMaterial(trans('admin.gender'),'gender',['null'=>trans('admin.select_gender'),'0'=>trans('admin.male') , '1' =>trans('admin.female')],null,$errors->first('gender'))}}
                            </div>
                            <div class="col-md-12">
                                <div class='form-group label-floating'>
                                    <button class='btn btn-success-alt btn-block submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.update_info')</button>
                                </div>
                            </div>
                        </div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                    <h4 class="panel-title"> @lang('admin.change_password')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => array('admin/profile/set_password'),'method'=> 'post','class' => 'submit-ajax')) }}
                        <div class="col-md-12">
                            {{Markup::textInputPasswordMaterial(trans('admin.current_password'),'currentPassword',$errors->first('currentPassword'))}}
                        </div>
                        <div class="col-md-12">
                            {{Markup::textInputPasswordMaterial(trans('admin.new_password'),'password',$errors->first('password'))}}
                        </div>
                        <div class="col-md-12">
                            {{Markup::textInputPasswordMaterial(trans('admin.confirm_new_password'),'confirmPassword',$errors->first('confirmPassword'))}}
                        </div>
                        <div class="col-md-12">
                            <div class='form-group label-floating'>
                                <button class='btn btn-success-alt btn-block submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.Update_password')</button>
                            </div>
                        </div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                    <h4 class="panel-title">@lang('admin.update_email')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => array('admin/profile/change_email'),'method'=> 'post','class' => 'submit-ajax')) }}
                        <div class="col-md-12 ">
                            {{Markup::textInputPasswordMaterial(trans('admin.current_password'),'currentPasswordEmail',$errors->first('currentPasswordEmail'))}}
                        </div>
                        <div class="col-md-12">
                            {{Markup::textInputMaterial(trans('admin.user_email'),'email',$user->email,$errors->first('email'))}}
                        </div>
                        <div class="col-md-12">
                            <div class='form-group label-floating'>
                                <button class='btn btn-success-alt btn-block submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.update_email')</button>
                            </div>
                        </div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>
    </div>
</div>
@endsection
