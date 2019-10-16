<?php
namespace App\Models;
/**
 *
 * @property int is_side
 * @property int parent_id
 * @property string name_ar
 * @property string name_en
 * @property string slug_ar
 * @property string slug_en
 *
 */

class Categories extends BaseModel {
    public $timestamps = false;
    public static $rules = array(
        'name_ar'    => 'required|max:50|unique:categories,name_ar',
        'name_en'    => 'required|max:50|unique:categories,name_en',
        'slug_ar'     => 'required|max:150|unique:categories,slug_ar',
        'slug_en'     => 'required|max:150|unique:categories,slug_en'
    );
    public function categoriesByLangLight(){
        return $this->select('name_'.$this::$language.' as name','id');
    }
    public function childListAll(){
        return  $this->hasMany('App\Models\Categories', 'parent_id', 'id');
    }
    public function childParent(){
        return $this->belongsTo('App\Models\Categories','parent_id');
    }
    public function dishes(){
        return $this->hasMany('App\Models\Dish','category_id');
    }
    public function dishesActive(){
        return $this->hasMany('App\Models\Dish','category_id')->whereIsActive(1);
    }
    public function dishesAdmin(){
        return $this->hasMany('App\Models\Dish','category_id')->select(['id','name_en']);
    }
    protected static function boot() {
        parent::boot();
        static::deleting(function($category) {
            // before delete() method call this
            $category->dishes()->delete();
        });
    }
}
