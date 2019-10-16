<div class='row'>
    <div class="col-md-3">
        {{Markup::textInputMaterial('Module name english', 'name_en', null, $errors->first('name_en'))}}
    </div>
    <div class="col-md-3">
        {{Markup::textInputMaterial('Module name arabic', 'name_ar', null, $errors->first('name_ar'))}}
    </div>
    <div class="col-md-3">
        {{Markup::textInputMaterial('Module icon', 'icon', null, $errors->first('icon'))}}
    </div>
    <div class="col-md-3">
        {{Markup::textInputMaterial('Module style', 'view_style', null, $errors->first('view_style'))}}
    </div>
</div>
<div class='row'>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have name', 'have_name', '')}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have details', 'have_details', '')}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have short', 'have_short', '')}}
    </div>
</div>
<div class='row'>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have status','have_status','')}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have gallery', 'have_gallery', '')}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have seo', 'have_seo', '')}}
    </div>
</div>
<div class='row'>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have ordered', 'have_ordered', '')}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have add New', 'have_add_new', '')}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have single','single','')}}
    </div>
</div>
<div class='row'>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Show in menu','show_menu','')}}
        {{Markup::textInputMaterial('Order in menu','order_menu', null)}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have parent','have_parent_module','')}}
        {{Markup::selectOptionMaterial('Parent module','parent_module',['null'=>'Select parent'] + $modulesList, null,$errors->first('parent_module'))}}
    </div>
    <div class="col-md-4">
        {{Markup::checkboxMatrial('Have Thumbnail','have_thumbnail','')}}
        {{Markup::textInputMaterial('Thumbnail Sizes','thumbnail_sizes', null)}}
    </div>
</div>
<hr>
<div class='row form-group' style="margin-bottom: 15px">
    <h2>Othet inputs</h2>
    <div class="row form-group">
        <div class="col-md-12">
            {{Markup::checkboxMatrial('Update Other Inputs','have_other_inputs_update','')}}
        </div>
        <div class="col-md-12">
            {{Markup::checkboxMatrialDisabled('Have Other Inputs','have_other_inputs','passcheck')}}
        </div>

        <div class="col-md-12">
            <button class="btn btn-brown-alt btn-xs  btn-block add_field_button nomargin passcheck" type="submit">Add New Input</button>
        </div>
    </div>
    <div class="col-md-12" id="input_fields_wrap">
        <div class="hidden" id="template_other_input">
            <div class="row" style="border:1px solid #f2f4f6;margin-bottom: 4px;">
                <div class="col-md-12">
                    <div class="col-md-2">
                        {{Markup::selectOptionMaterial('Type','other_input_type[]',['null'=>'Select type','text'=>'Text' , 'image' =>'Image', 'select' =>'Select', 'textarea' =>'Textarea', 'multi' =>'Multi', 'file' =>'File'],'text')}}
                    </div>
                    <div class="col-md-2">
                        {{Markup::textInputMaterial('Key','other_input_key[]', null)}}
                    </div>
                    <div class="col-md-2">
                        {{Markup::textInputMaterial('Name en','other_input_name_en[]', null)}}
                    </div>
                    <div class="col-md-2">
                        {{Markup::textInputMaterial('Name ar','other_input_name_ar[]', null)}}
                    </div>
                    <div class="col-md-2">
                        {{Markup::textInputMaterial('Class','other_input_class[]', null)}}
                    </div>
                    <div class="col-md-2">
                        {{Markup::textInputMaterial('Sizes','other_input_sizes[]', null)}}
                    </div>
                    <div class="col-md-6">
                        {{Markup::textInputMaterial('Options en','other_input_options_en[]', null)}}
                    </div>
                    <div class="col-md-6">
                        {{Markup::textInputMaterial('Options ar','other_input_options_ar[]', null)}}
                    </div>
                </div>
                <div class="col-md-12" ><button class="btn btn-default btn-block remove_field passcheck" type="button"><i class="fa fa-unlink"></i></button></div>
            </div>
        </div>
        @if(!empty($module))
            @if($module->other_inputs != null)
                @foreach($module->other_inputs as $input)
                <div class="row" style="border:1px solid #f2f4f6;margin-bottom: 4px;">
                    <div class="col-md-12">
                        <div class="col-md-2">
                            {{Markup::selectOptionMaterialDisabled('Type','other_input_type[]',['null'=>'Select type','text'=>'Text' , 'image' =>'Image', 'select' =>'Select', 'textarea' =>'Textarea', 'multi' =>'Multi', 'file' =>'File'],$input->type)}}
                        </div>
                        <div class="col-md-2">
                            {{Markup::textInputMaterialDisabled('Key','other_input_key[]', $input->key,'passcheck')}}
                        </div>
                        <div class="col-md-2">
                            {{Markup::textInputMaterialDisabled('Name en','other_input_name_en[]', $input->name_en,'passcheck')}}
                        </div>
                        <div class="col-md-2">
                            {{Markup::textInputMaterialDisabled('Name ar','other_input_name_ar[]', $input->name_ar,'passcheck')}}
                        </div>
                        <div class="col-md-2">
                            {{Markup::textInputMaterialDisabled('Class','other_input_class[]', $input->class,'passcheck')}}
                        </div>
                        <div class="col-md-2">
                            {{Markup::textInputMaterialDisabled('Sizes','other_input_sizes[]', $input->sizes,'passcheck')}}
                        </div>
                        <div class="col-md-6">
                            {{Markup::textInputMaterialDisabled('Options en','other_input_options_en[]', $input->options_en,'passcheck')}}
                        </div>
                        <div class="col-md-6">
                            {{Markup::textInputMaterialDisabled('Options ar','other_input_options_ar[]', $input->options_ar,'passcheck')}}
                        </div>
                    </div>
                    <div class="col-md-12" ><button class="btn btn-default btn-block remove_field passcheck" type="button"><i class="fa fa-unlink"></i></button></div>
                </div>
                @endforeach
            @endif
        @endif
    </div>
</div>
<div class='row form-group'>
    <h2>Alias of module</h2>
    <div class="col-md-12" style="border:1px solid #f2f4f6;margin-bottom: 4px;">
        <div class="col-md-2">
            {{Markup::textInputMaterial('Key','alias_key[0]', 'name')}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name english','alias_en[0]', !empty($module) ? $module->aliases->name->name_en : "")}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name Arabic','alias_ar[0]', !empty($module) ? $module->aliases->name->name_ar : "")}}
        </div>
    </div>
    <div class="col-md-12" style="border:1px solid #f2f4f6;margin-bottom: 4px;">
        <div class="col-md-2">
            {{Markup::textInputMaterial('Key','alias_key[1]', 'details')}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name english','alias_en[1]', !empty($module) ? $module->aliases->details->name_en : "")}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name Arabic','alias_ar[1]', !empty($module) ? $module->aliases->details->name_ar : "")}}
        </div>
    </div>
    <div class="col-md-12" style="border:1px solid #f2f4f6;margin-bottom: 4px;">
        <div class="col-md-2">
            {{Markup::textInputMaterial('Key','alias_key[2]', 'short')}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name english','alias_en[2]', !empty($module) ? $module->aliases->short->name_en : "" )}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name Arabic','alias_ar[2]', !empty($module) ? $module->aliases->short->name_ar : "" )}}
        </div>
    </div>
    <div class="col-md-12" style="border:1px solid #f2f4f6;margin-bottom: 4px;">
        <div class="col-md-2">
            {{Markup::textInputMaterial('Key','alias_key[3]', 'upload')}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name english','alias_en[3]', !empty($module)?$module->aliases->upload->name_en : "" )}}
        </div>
        <div class="col-md-5">
            {{Markup::textInputMaterial('Name Arabic','alias_ar[3]', !empty($module)?$module->aliases->upload->name_ar : "" )}}
        </div>
    </div>
</div>
<div class='row form-group'>
    <hr>
    <h3>Rules of module</h3>
    <div class="hidden" id="add_rules_template">
        <div class="row"  style="border:1px solid #f2f4f6;margin-bottom: 4px;">
            <div class="col-md-11">
                <div class="col-md-2">
                    {{Markup::textInputMaterial('Key','rules_key[]', null)}}
                </div>
                <div class="col-md-5">
                    {{Markup::textInputMaterial('Rules','rules_val[]', null)}}
                </div>
                <div class="col-md-5">
                    {{Markup::textInputMaterial('Rules edit','rules_val_edit[]', null)}}
                </div>
            </div>
            <div class="col-md-1" ><div class="form-group "><button class="btn btn-danger remove_rules_btn" type="button"><i class="fa fa-unlink"></i></button></div></div>
        </div>
    </div>
    <div class="col-md-12">
        <button class="btn btn-brown-alt btn-block" type="submit" id="add_rules_btn">Add rule</button>
    </div>
    <div class="col-md-12"  id="add_rules_wrap">
        @if(!empty($module))
        @if(count($module->ruleses))
            @foreach($module->ruleses as $rules)
                <div class="row"  style="border:1px solid #f2f4f6;margin-bottom: 4px;">
                    <div class="col-md-11">
                        <div class="col-md-2">
                            {{Markup::textInputMaterial('Key','rules_key[]', $rules->rule_key)}}
                        </div>
                        <div class="col-md-5">
                            {{Markup::textInputMaterial('Rules','rules_val[]', $rules->rule_val)}}
                        </div>
                        <div class="col-md-5">
                            {{Markup::textInputMaterial('Rules edit','rules_val_edit[]', $rules->rule_val_edit)}}
                        </div>
                    </div>
                    <div class="col-md-1" >
                        <div class="form-group ">
                            <button class="btn btn-danger remove_rules_btn" type="button">
                                <i class="fa fa-unlink"></i>
                            </button>
                        </div>
                    </div>
                </div>
            @endforeach
        @endif
        @endif
    </div>
</div>
