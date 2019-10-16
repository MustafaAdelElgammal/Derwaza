<?php
namespace app\Models;
use App\Models\BaseModel;
class Post extends BaseModel{
    public $timestamps = false;
    public function postConfig(){
        return $this->belongsTo('App\Models\PostConfig','config_id','id');
    }
    public function getOtherInputsValuesAttribute($value){
        $a = json_decode($value);
        return $a[0];
    }
}
