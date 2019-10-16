<?php $m=12;?>
@if($module->have_thumbnail)
    <?php $m=8;?>
    <div class="col-md-4">
        <?php $sizes = explode('&',preg_replace('/[^A-Za-z0-9\+&_]/', '', $module->thumbnail_sizes)) ;
        $size =  explode('_',preg_replace('/[^A-Za-z0-9\+_]/', '', $sizes[0]));?>
        {{Markup::imageFileInput($module->alias->upload->$name , 'upload_'.$language,$post->upload != null ? 'posts/'.$module->slug . '/' .$post->upload : false, ''. $size[0] . '',''. $size[1] . '',$errors->first('upload_'.$language))}}
@endif
@if($module->have_other_inputs == 1)
    
    @foreach( $module->other_inputs as $input)
        <?php
            $inputsVal = $post->other_inputs_values;
            $key = $input->key ;
            $alias_name = $input->$name ;
            $value = empty($inputsVal->$key) ? null : $inputsVal->$key ;
            //unset($module->other_inputs[0]);
        ?>
        @if($input->type == 'image')
            @if($m == 12)
                <?php $m=8;?>
                <div class="col-md-4">
            @endif
            {{Markup::imageFileInput($alias_name, $input->key . '_' . $language, $value != null ? 'posts/' . $module->slug . '/' . $value : false, '300px','300px', $errors->first($input->key.'_'.$language))}}
        @elseif($input->type == 'file')
                @if($m == 12)
                    <?php $m=8;?>
                    <div class="col-md-4">
                @endif
            {{Markup::textFileInput($alias_name, $input->key . '_' . $language, $value != null ? 'posts/' . $module->slug . '/files' . '/' . $value : false,  $errors->first($input->key.'_'.$language))}}
        @endif
    @endforeach
@endif
@if($m == 8)
    </div>
@endif
<div class="col-md-{{$m}}">
@if($module->have_name)
    <div class="col-md-12">{{Markup::textInputMaterial($module->alias->name->$name,'name_'.$language, $post->name,$errors->first('name_'.$language))}}</div>
@endif
@if($module->have_other_inputs == 1)
    <div class="col-md-12">
        @foreach( $module->other_inputs as $input)
            <?php
                $inputsVal = $post->other_inputs_values;
                $key = $input->key ;
                $alias_name = $input->$name ;
                $value = empty($inputsVal->$key) ? null : $inputsVal->$key ;
            ?>
            @if($input->type == 'text')
                {{Markup::textInputMaterial($alias_name, $key . '_' . $language, $value, $errors->first($key. '_'.$language))}}
            @elseif($input->type == 'select')
                <?php
                    $optionSting =  explode('|', $input->{"options_" . $lang});
                    $optionArrayList=array();
                    foreach($optionSting as $option){
                        $optionFinal =  explode(',',$option);
                        $optionArrayList[$optionFinal[0]] = $optionFinal[1];
                    }
                ?>
                {{Markup::selectOptionMaterial($alias_name ,$input->key . '_' . $language, $optionArrayList, $value, $errors->first($key. '_'.$language))}}
            @endif
        @endforeach
    </div>
@endif
@if($module->have_details)
    <div class="col-md-12">{{Markup::textAreaSummer($module->alias->details->$name,'details_'.$language, $post->details, 'desc' ,$errors->first('details_'.$language))}}</div>
@endif
@if($module->have_short)
    <div class="col-md-12">
        {{Markup::textAreaSummer($module->alias->short->$name,'short_'.$language, $post->short, 'short-area' ,$errors->first('short_'.$language))}}
    </div>
@endif
@if($module->have_other_inputs == 1)
    <div class="col-md-12">
        @foreach( $module->other_inputs as $input)
            <?php
                $inputsVal = $post->other_inputs_values;
                $key = $input->key ;
                $alias_name = $input->$name ;
                $value = empty($inputsVal->$key) ? null : $inputsVal->$key ;
            ?>
            @if($input->type == 'textarea')
                    {{Markup::textArea($alias_name, $key  . '_' . $language, $value, 4, null, $errors->first($key . '_' . $language))}}
            @elseif($input->type == 'multi')
                {{Markup::textMulti($alias_name, $key . '_' . $language, $value, $errors->first($key . '_' . $language))}}
            @endif
        @endforeach
    </div>
@endif
@if($module->have_seo)
    <div class="col-md-12">{{Markup::textAreaMaterial( trans('admin.description') . ' SEO', 'desc_'.$language, $post->desc, 4)}}</div>
@endif
</div>
