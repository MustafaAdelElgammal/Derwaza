<div class="col-md-12 mb30">
    <div class="row mb20">
        <div class="col-md-5">
            <div class='form-group label-floating'>
                <label for='category_id' class='control-label'>@lang('admin.Select_dish_category_title') *</label>
                <select class="chosen-select form-control" name="category_id" id="category_id">
                    <option value="null">@lang('admin.chose_category')</option>
                    @foreach($categories as $cat)
                        <option value="{{$cat->id}}" class="type-{{$cat->is_side}}" @if($dish != null) @if($cat->id == $dish->category_id) selected @endif @endif>{{$cat->$name}}</option>
                    @endforeach
                </select>
                <span class='help-block'></span>
                @if($errors->first('category_id'))
                    <span class='help-block'>{{$errors->first('category_id')}}</span>
                @endif
            </div>
        </div>
        <div class="col-md-4">
            {{Markup::selectOptionMaterial(trans('admin.dish_status') . '*' , 'is_active', ['0' => trans('admin.not_published'), '1' => trans('admin.published')], '1', $errors->first('is_active'))}}
        </div>
        <div class="col-md-3">
            {{Markup::textInputMaterial('Default Price*', 'price', null, $errors->first('price'), 8, "validateWithoutZero(event)")}}
        </div>
    </div>
    <div class="row mb20">
        <div class="col-md-5">
            {{Markup::imageFileInput(trans('admin.dish_cover_ar') . ' *', 'image_ar', $dish != null ? 'dishes/616_362_'.$dish->image_ar : false,'616','362',$errors->first('image_ar'))}}
        </div>
        <div class="col-md-7">
            <br>
            <div class="col-md-12 mb20">
                {{Markup::textInputMaterial('Dish Link Page(ar) *', 'slug_ar', null, $errors->first('slug_ar'), 150)}}
            </div>
            <div class="col-md-12 mb20">
                {{Markup::textInputMaterial(trans('admin.dish_name_ar') . ' *', 'name_ar', null, $errors->first('name_ar'), 75)}}
            </div>
            <div class="col-md-12 mb20">
                {{Markup::textInputMaterial('Alt Meta(ar) *', 'alt_meta_ar', null, $errors->first('alt_meta_ar'), 75)}}
            </div>
            <div class="col-md-12 mb20">
                <hr style="border-color: #fff;">
                {{Markup::textAreaMaterial(trans('admin.dish_info_ar') . '*','details_ar',  !empty($dish) ? $dish->details_ar : null , '5' ,$errors->first('details_ar'), 500)}}
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-5">
            {{Markup::imageFileInput(trans('admin.dish_cover_en') . ' *', 'image_en', !empty($dish) ? 'dishes/616_362_'.$dish->image_en : false,'616','362',$errors->first('image_ar'))}}
        </div>
        <div class="col-md-7">
            <br>
            <div class="col-md-12 mb20">
                {{Markup::textInputMaterial('Dish Link Page(en) *', 'slug_en', null, $errors->first('slug_en'), 150)}}
            </div>
            <div class="col-md-12 mb20">
                {{Markup::textInputMaterial(trans('admin.dish_name_en') . ' *', 'name_en', null, $errors->first('name_en'), 75)}}
            </div>
            <div class="col-md-12 mb20">
                {{Markup::textInputMaterial('Alt Meta(en) *', 'alt_meta_en', null, $errors->first('alt_meta_en'), 75)}}
            </div>
            <div class="col-md-12 mb20">
                <hr style="border-color: #fff;">
                {{Markup::textAreaMaterial(trans('admin.dish_info_en') . '*','details_en', !empty($dish) ? $dish->details_en : null, '5' ,$errors->first('details_en'), 500)}}
            </div>
        </div>
    </div>
</div>
@include('admin.dishes.branches_price')