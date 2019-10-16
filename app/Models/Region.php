<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Region extends Model{
    public $timestamps = false;
    public static $rules = array('name_ar' => 'required', 'name_en' => 'required', 'status' => 'required');
    public static function getAllCities(){
        return Region::where('parent', 0)->get();
    }
    public static function getAllCitiesAvailableList($lang){
        return Region::whereParent(0)->whereStatus(1)->pluck('name_'.$lang, 'id')->all();
    }

    public static function getAllAreasAvailableList($lang, $city_id){
        return Region::whereParent($city_id)->whereStatus(1)->pluck('name_'.$lang, 'id')->all();
    }
    public static function getAllAreasAvailableListJson($lang, $city_id){
        return Region::whereParent($city_id)->whereStatus(1)->get();

    }
    public function citiesJson(){
        return $this->hasMany('Region','parent')->select('name_'.Start::$language, 'id');
    }
    public function childrenAreas() {
        return $this->hasMany('App\Models\Region','parent');
    }
    public function parentCity() {
        return $this->belongsTo('App\Models\Region','parent');
    }
}
