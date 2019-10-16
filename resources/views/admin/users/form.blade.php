<?php $readonly = $user == null ? false : true;?>
<div class="row mb20">
    <div class="col-md-6">
        {{Markup::textInputMaterial(trans('admin.first_name'), 'first_name',null,$errors->first('first_name'), 25, null, $readonly)}}
    </div>
    <div class="col-md-6">
        {{Markup::textInputMaterial(trans('admin.last_name'), 'last_name',null,$errors->first('last_name'), 25, null, $readonly)}}
    </div>
</div>
<div class="row mb20">
    <div class="col-md-6">
        {{Markup::textInputMaterial(trans('admin.user_email'),'email',null,$errors->first('email'), '', null, $readonly)}}
    </div>
    <div class="col-md-6">
        {{Markup::selectOptionMaterial(trans('admin.user_role'), 'role_id', ['null'=>trans('admin.select_role')] + $roles, null,$errors->first('role_id'), '', $readonly)}}
    </div>
</div>
<div class="row mb20">
    <div class="col-md-6">
        {{Markup::selectOptionMaterial(trans('admin.gender'), 'gender', ['null' => trans('admin.select_gender'), '0' => trans('admin.male') , '1' => trans('admin.female')], null, $errors->first('gender'), '', $readonly)}}
    </div>
    <div class="col-md-6">
        {{Markup::selectOptionMaterial(trans('admin.user_status'),'is_active',[ '1' => trans('admin.active'), '0' => trans('admin.not_active') ], null, $errors->first('is_active'))}}
    </div>
</div>
<div class="row mb20">
    <?php $hidden = '';?>
    @if(!empty($user))
      <?php $hidden = 'hidden';?>
      <div class="col-md-3">
        <div class="form-group label-floating">
          <div class="checkbox" style="padding-left: 0">
              <label><input type="checkbox" @if(old('change_password')) checked @endif id="password-change-check" value="1" name="change_password"> @lang('admin.change_password')</label>
          </div>
        </div>
      </div>
    @endif
    <div id="password-change-inputs" class="{{$hidden}}">
        <div class="col-md-4">
            {{Markup::textInputPasswordMaterial(trans('admin.password'),'password',$errors->first('password'), 25)}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputPasswordMaterial(trans('admin.confirm_password'),'confirmPassword',$errors->first('confirmPassword'), 25)}}
        </div>
    </div>
</div>
