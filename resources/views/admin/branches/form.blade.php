<div class="col-md-12">
    <div class="row mb30">
        {{--<div class="col-md-3">--}}
            {{--<div class='form-group label-floating'>--}}
                {{--<label for='region' class='control-label'>Branch City *</label>--}}
                {{--<select class="chosen-select form-control" name="region" id="region">--}}
                    {{--<option value="null">Choose City</option>--}}
                    {{--@foreach($regions as $region)--}}
                        {{--<option value="{{$region->id}}" @if($branch != null) @if($region->id == $branch->region_id) selected @endif @endif>{{$region->name_en}}</option>--}}
                    {{--@endforeach--}}
                {{--</select>--}}
                {{--<span class='help-block'></span>--}}
            {{--</div>--}}
        {{--</div>--}}
        <div class="col-md-3">
            {{Markup::selectOptionMaterial('Branch status *' ,'is_active', ['1' => trans('admin.published'), '0' => trans('admin.not_published')], null,$errors->first('is_active'))}}
        </div>
        <div class="col-md-3">
            {{Markup::textInputMaterial('Branch latitude *', 'latitude',  !empty($branch) ? $branch->latitude : null , $errors->first('latitude'), 20, "validateWithoutZero(event)")}}
        </div>
        <div class="col-md-3">
            {{Markup::textInputMaterial('Branch longitude *', 'longitude',  !empty($branch) ? $branch->longitude : null , $errors->first('longitude'), 20, "validateWithoutZero(event)")}}
        </div>
    </div>
    <div class="row mb30">
        <div class="col-md-6">
            {{Markup::textInputMaterial('Branch name (ar) *', 'name_ar',  !empty($branch) ? $branch->name_ar : null , $errors->first('name_ar'), 75)}}
        </div>
        <div class="col-md-6">
            {{Markup::textInputMaterial('Branch name (en) *', 'name_en',  !empty($branch) ? $branch->name_en : null , $errors->first('name_en'), 75)}}
        </div>
    </div>
    <div class="row mb30">
        <div class="col-md-6">
            {{Markup::textInputMaterial('Branch address (ar) *', 'address_ar',  !empty($branch) ? $branch->address_ar : null , $errors->first('address_ar'), 150)}}
        </div>
        <div class="col-md-6">
            {{Markup::textInputMaterial('Branch address (en) *', 'address_en',  !empty($branch) ? $branch->address_en : null , $errors->first('address_en'), 150)}}
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            {{Markup::textInputMaterial('Branch main phone *', 'phone',  !empty($branch) ? $branch->phone : null , $errors->first('phone'), 8, "validateWithoutZero(event)")}}
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            {{Markup::textInputMaterial('Branch main email', 'email',  !empty($branch) ? $branch->email : null , $errors->first('email'),'email')}}
        </div>
    </div>
    <div class="row mb30">
        <div class="col-md-12">
            {{Markup::textMulti('Other contacts', 'phones', !empty($branch) ? $branch->phones : null, $errors->first('phones'))}}
        </div>
    </div>
</div>

{{--@if($branch != null)--}}
    {{--@if($branch->type == 0)--}}
        {{--<h4>Prices For Branch</h4>--}}
        {{--@include('admin.branches.dishes_price')--}}
    {{--@endif--}}
{{--@endif--}}