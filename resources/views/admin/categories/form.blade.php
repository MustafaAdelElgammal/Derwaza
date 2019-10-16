<div class="tab-pane">
    <div class="row">
        <div class="col-md-6">
            {{Markup::textInputMaterial(trans('admin.category_name_ar') . ' *', 'name_ar', null, $errors->first('name_ar'),50)}}
            {{Markup::textInputMaterial('Category Link Page (ar) *', 'slug_ar', null, $errors->first('slug_ar'), 150)}}

        </div>
        <div class="col-md-6">
            {{Markup::textInputMaterial(trans('admin.category_name_en') . ' *', 'name_en', null,$errors->first('name_en'),50)}}
            {{Markup::textInputMaterial('Category Link Page (en) *', 'slug_en', null, $errors->first('slug_en'), 150)}}
        </div>
    </div>
    <br>
</div>
