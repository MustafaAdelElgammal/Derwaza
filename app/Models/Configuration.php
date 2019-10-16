<?php
namespace app\Models;
use App\Models\BaseModel;
class Configuration extends BaseModel{
    public function setSocialAttribute($value){
        $this->attributes['social'] =  serialize($value);
    }
    public function getSocialAttribute($value){
        return unserialize($value);
    }
}
