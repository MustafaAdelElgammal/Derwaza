<?php
namespace app\Models;
use App\Models\BaseModel,Helper;
class Module extends BaseModel {

    public $timestamps = false;
    public static $rulesCreate = array('name_en' => 'required', 'name_ar' => 'required', 'icon' => 'required','view_style' => 'required');
    public static $rulesEdit   = array('name_en' => 'required', 'name_ar' => 'required', 'icon' => 'required','view_style' => 'required');
    public function getAliasAttribute($value){
        $a = json_decode($value);
        return count($a) > 0 ? $a[0] : null;
    }
    public function getRulesAttribute($value){
        $a = json_decode($value);
        return count($a) > 0 ? $a[0] : null;
    }
    public function getRulesEditAttribute($value){
        $a = json_decode($value);
        return count($a) > 0 ? $a[0] : null;
    }
    public function postConfig(){
        return $this->hasMany('App\Models\PostConfig','module_id')->where('status','=',0)->orderby('id','desc');
    }
    public function postConfigSingle(){
        return $this->hasOne('App\Models\PostConfig','module_id');
    }

    protected static function boot() {
        parent::boot();
        static::deleting(function($module) {
            foreach ($module->postConfig as $config) {

                if ($module->have_thumbnail){
                    $ds = DIRECTORY_SEPARATOR;
                    $sizes  = explode('&',preg_replace('/[^A-Za-z0-9\+&_]/', '', '300_300&'.$module->thumbnail_sizes));
                    $path = "upload" . $ds . "posts" . $ds . $module->slug;
                    foreach($config->posts as $post){
                       Helper::deleteFile($post->upload, $path, $sizes);
                    }
                }
                $config->posts()->delete();
            }
            $module->postConfig()->delete();
        });
    }

}
