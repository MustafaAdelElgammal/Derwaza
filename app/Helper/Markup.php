<?php
namespace app\Helper;
use Form, Image, Html;
class Markup {

    public static function textInputFront($label ,$name,$value,$type,$error=null,$max="",$pattern=null){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<fieldset class='$class'>";
        $html .=     Form::text($name,$value,array(
            'class'=>'',
            'type' => $type ,
            'id' => $name,
            'onkeypress' => $pattern,
            'maxlength' => $max,
            'placeholder'=>$label
        ));
        $html .=    "<span class='help-block'>$error</span>";
        $html .= '</fieldset>';
        echo $html;
    }
    public static function dateInputFront($lable,  $name,$value=null,$error=null){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<fieldset class='$class'>";
        $html .=    "<input type='text' name='$name' id='$name' value='$value' tabindex='1' class='datepicker'  autocomplete='off' placeholder='$lable' readonly='readonly'>";
        $html .=    "<span class='help-block'>$error</span>";
        $html .= '</fieldset>';
        echo $html;
    }
    public static function selectOptionFront($label ,$name,$array,$value,$error=null){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<div class='$class'>";
        $html .= Form::select($name, $array, $value, array("class"=>"kode-selecter",'id' => $name, 'style' => 'width: 100%'));
        $html .= "<span class='help-block'>$error</span>";
        $html .= '</div>';
        echo $html;
    }
    public static function textInputPasswordFront($label ,$name,$error,$max="",$pattern=""){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<fieldset class='$class'>";
        $html .=     Form::password($name,array('class'=>'','id' => $name, 'maxlength'=> $max,'placeholder'=>$label));
        $html .=    "<span class='help-block'>$error</span>";
        $html .= '</fieldset>';
        echo $html;
    }
    public static function checkBoxFront($label , $name, $old = null,$error=null){
        $class = $error != null ? "has-error is-focused" : "";
        $check = $old != null ? 'checked' : '';
        $html  = "<div class='kode_checkbox_style donate_checkbox_style $class'><label>";
        $html .= "<input type='checkbox' name='$name' $check value='1'><span></span><small>$label</small>";
        $html .= '</div></label>';
        echo $html;
    }
    public static function textInputValidCodeFront($name,$value,$error){
        $class = $error != null ? "has-error is-focused" : "";

        $html  = "<div class='col-md-6 '><label>";
        $html .= "<input value='$value' type='text'   name='valid_show'      id='valid' disabled='disabled' style='text-align: center; color: #7b7b7b; font-size: 1.7em; font-weight: bold;-webkit-user-select: none; -khtml-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none;'>";
        $html .= "<input value='$value' type='hidden' name='valid_code' id='valid_code'>";
        $html .= '</label></div>';
        $html .= "<div class='col-md-6 $class'><label>";
        $html .= "<input type='text' name='valid' id='valid' placeholder='".trans('web.valid')."' style='text-align: center;font-size: 2em;color: #16c365;border: 1px sold #ddd;/* letter-spacing: 1.5px; */font-weight: bold;font-family: monospace;background: #f6f6f6;padding: 6px;'>";
        $html .= '</label>';
        $html .=    "<span class='help-block'>$error</span>";

        $html .='</div>';


        echo $html;
    }
    public static function textInputMaterial($label ,$name,$value,$error=null,$max="",$pattern=null,$disabled=false){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<div class='form-group label-floating $class'>";
        $html .=    "<label for='$name' class='control-label'>$label</label>";
        $html .=     Form::text($name,$value,array('class'=>'form-control','id' => $name , 'maxlength' => $max,'onkeypress' => $pattern, $disabled ? 'disabled': ''));
        $html .=    "<span class='help-block'>$error</span>";
        $html .= '</div>';
        echo $html;
    }
    public static function textInputPasswordMaterial($label ,$name,$error){
        $class = $error != null ? " has-error is-focused" : "";
        $html  = "<div class='form-group label-floating$class'>";
        $html .=    "<label for='$name' class='control-label'>$label</label>";
        $html .=     Form::password($name,array('class'=>'form-control','id' => $name));
        $html .=    "<span class='help-block'>$error</span>";
        $html .= '</div>';
        echo $html;
    }
    public static function textInputMaterialDisabled($label ,$name,$value,$class){
        $html  = "<div class='form-group label-floating'>";
        $html .=    "<label for='$name' class='control-label'>$label</label>";
        $html .=     Form::text($name,$value,array('class'=>'form-control ' . $class, 'id' => $name, 'disabled' => 'disabled'));
        $html .=    "<span class='help-block hidden'></span>";
        $html .= '</div>';
        echo $html;
    }
    public static function textAreaMaterial($label ,$name,$value,$rows,$class="",$max =null){
        $html  = "<div class='form-group label-floating'>";
        $html .=    "<label for='$name' class='control-label'>$label</label>";
        $html .=    "<textarea class='form-control $class' name='$name' id='$name' cols='50' rows='$rows' maxlength='$max'>$value</textarea>";
        $html .=    "<span class='help-block hidden'></span>";
        $html .= '</div>';
        echo $html;
    }
    public static function textAreaSummer($label ,$name,$value,$type,$error=null){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<div class='textareaeditor'>";
        $html .=    "<div class='form-group $class'>";
        $html .=        "<div class='summer-label'>";
        $html .=            "<span class='title-summer'> $label </span> ";
        $html .=        "</div>";
        $html .=        "<textarea class='form-control $type' name='$name' id='$name'>$value</textarea>";
        $html .=        "<span class='help-block'> $error </span>";
        $html .=    "</div>";
        $html .= "</div>";
        echo $html;
    }
    public static function textArea($label ,$name,$value,$rows,$max =null,$error=null){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<div class='form-group $class'>";
        $html .=    "<label for='$name' class='control-label'>$label</label>";
        $html .=    "<textarea class='form-control' name='$name' id='$name' cols='50' rows='$rows' maxlength='$max'>$value</textarea>";
        $html .=    "<span class='help-block'>$error</span>";
        $html .= '</div>';
        echo $html;
    }
    public static function selectOptionMaterial($label ,$name,$array,$value,$error=null,$isSearch = "",$disabled=false){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<div class='form-group label-floating $class'>";
        $html .= "<label for='$name' class='control-label'>$label</label>";
        $html .= Form::select($name, $array, $value, array("class"=>"form-control $isSearch",'id' => $name, $disabled ? 'disabled': ''));
        $html .= "<span class='help-block'>$error</span>";
        $html .= '</div>';
        echo $html;
    }
    public static function selectOptionMaterialDisabled($label ,$name,$array,$value,$error=null){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<div class='form-group label-floating $class'>";
        $html .= "<label for='$name' class='control-label'>$label</label>";
        $html .= Form::select($name, $array, $value, array("class"=>"form-control passcheck",'id' => $name, 'disabled' => 'disabled'));
        $html .= "<span class='help-block'>$error</span>";
        $html .= '</div>';
        echo $html;
    }
    public static function checkboxMatrial($label ,$name,$class){
        $html  = "";
        $html .= "<div class='ckbox ckbox-success'>";
        $html .= Form::checkbox($name, 1, null, ['class' => $class , 'id' => $name]);
        $html .= "<label for='$name'>$label</label>";
        $html .= "</div>";
        echo $html;
    }
    public static function checkboxMatrialDisabled($label ,$name,$class){
        $html  = "";
        $html .= "<div class='ckbox ckbox-success'>";
        $html .= Form::checkbox($name, 1, null, ['class' => $class , 'disabled' => 'disabled', 'id' => $name]);
        $html .= "<label for='$name'>$label</label>";
        $html .= "</div>";
        echo $html;
    }
    public static function imageFileInput($label ,$name,$path=false,$width="300px",$height="150px",$error=null,$required = ''){
        $type = $path == false ? 'new' : 'exists';
        $class = $error != null ? " has-error is-focused" : "";
        $html  = "<div class='form-group label-floating $class'>";
        $html .=    "<div class='fileinput fileinput-$type' data-provides='fileinput' id='$name' >";
        $html .=        "<div class='matrial-label'>";
        $html .=            "<span style='margin-bottom: 12px'> $label </span> ";
        $html .=        "</div>";
        $html .=        "<div class='fileinput-new thumbnail'>";
        $html .=            "<img src='http://via.placeholder.com/" . $width . "x" . $height ."'/>";
        $html .=        "</div>";
        $html .=        "<div class='fileinput-preview fileinput-exists thumbnail'>";
        $html .=        $path != false ? Html::image(asset(config('constants.optAdmin.up').'/'.$path),'alt',['class' => 'img-responsive']) : "";
        $html .=        "</div>";
        $html .=        "<div CLASS='fileinput-controller'>";
        $html .=            "<span class='btn btn-file'>";
        $html .=                "<a href='#' class='fileinput-new'><i class='fa fa-picture-o'></i>". trans('admin.select_image') . "</a>";
        $html .=                "<a href='#' class='fileinputchange fileinput-exists fileinputexists'><i class='fa fa-picture-o'></i> ". trans('admin.change_image') . " </a>";
        $html .=            "</span>";
        //$html .=            "<a href='#' class='fileinputremove btn btn-file fileinput-exists' data-dismiss='fileinput'><i class='fa fa-unlink'></i> ". trans('admin.remove_image') . " <div class='ripple-container'></div></a>";
        $html .=        "</div>";
        $html .=        "";
        $html .=        "<input type='file' name='$name'  $required accept='image/*'>";
        $html .=        "<span class='help-block'> $error </span>";
        $html .=    "</div>";
        $html .= "</div>";
        echo $html;
    }
    public static function textFileInput($label ,$name,$path=false, $error=null){
        $type = $path == false ? 'new' : 'exists';
        $class = $error != null ? " has-error is-focused" : "";
        $html  = "<div class='form-group label-floating $class'>";
        $html .=    "<div class='upload-file fileinput fileinput-$type' data-provides='fileinput' id='$name' >";
        $html .=        "<div class='matrial-label'>";
        $html .=            "<span> $label </span> ";
        $html .=            "<span class='help-block'> $error </span>";
        $html .=        "</div>";
        $html .=        Html::image(asset('public/admin/img/pdf_logo.png'),'alt',['class' => 'img-responsive']);
        $html .=        "<div class='fileinput-preview fileinput-exists thumbnail' style='line-height:0px'>";
        $html .=            $path != false ? "<a href='".asset('public/upload'.'/'.$path)."' target='_blank'>". trans('admin.view_file') ."</a>" : "";
        $html .=        "</div>";
        $html .=        "<div CLASS='fileinput-controller'>";
        $html .=            "<span class='btn btn-file'>";
        $html .=                "<a href='#' class='fileinput-new'><i class='fa fa-file'></i>". trans('admin.select_file') . "</a>";
        $html .=                "<a href='#' class='fileinputchange fileinput-exists fileinputexists'><i class='fa fa-file'></i> ". trans('admin.change_file') . " </a>";
        $html .=                "<input type='file' name='$name'>";
        $html .=            "</span>";
        //$html .=            "<a href='#' class='fileinputremove btn btn-file fileinput-exists' data-dismiss='fileinput'><i class='fa fa-unlink'></i> ". trans('admin.remove_image') . " <div class='ripple-container'></div></a>";
        $html .=        "</div>";
        $html .=        "";
        $html .=    "</div>";
        $html .= "</div>";
        echo $html;
    }
    public static function textMulti($label ,$name,$value,$error = null){
        $class = $error != null ? "has-error is-focused" : "";
        $html  = "<div class='form-group label-floating $class'>";
        $html .=    "<div class='summer-label' id='$name'>";
        $html .=        "<span> $label </span> ";
        $html .=        "<span class='help-block'> $error </span>";
        $html .=    "</div>";
        $html .= Form::text($name, $value, ['class'=>'multi-insert']);
        $html .= "</div>";
        echo $html;
    }
}
