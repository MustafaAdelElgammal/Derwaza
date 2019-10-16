<?php
namespace app\Models;
use App\Models\BaseModel;
class PostConfig extends BaseModel {

    public function orderTypesDo($id,$newOrder){
        $_this = $this->find($id);
        $oldOrder = $_this->ordered;
        $_this->ordered      = $this->all()->count() + 1 ;

        if($_this->save()){
            if($oldOrder > $newOrder){
                for( ;$oldOrder > $newOrder ; $oldOrder--){
                    $_thisItem = $this->where('ordered','=', $oldOrder - 1)->first();
                    $_thisItem->level = $_thisItem->level +1 ;
                    $_thisItem->save();
                }
            }elseif($oldOrder < $newOrder){
                for( ;$oldOrder < $newOrder ; ++$oldOrder){
                    $_thisItem = $this->where('ordered','=',$oldOrder + 1)->first();
                    $_thisItem->ordered = $_thisItem->level - 1 ;
                    $_thisItem->save();
                }
            }
            $_this->ordered = $newOrder;
            $_this->save();
            return true;
        }


        return false;
    }
    public function posts(){
        return $this->hasMany('App\Models\Post','config_id');
    }


    public function postByLang(){
        return $this->hasOne('App\Models\Post','config_id')->where('lang','=',$this::$language);
    }

    public function postBySetLang($language){
        return $this->hasOne('App\Models\Post','config_id')->where('lang','=',$language);
    }

    public function itemPost(){
        return $this->hasOne('App\Models\Post','config_id');
    }
    public function childList($module_id){
        return  $this->hasMany('App\Models\PostConfig', 'parent_id', 'id')->where('module_id','=',$module_id)->get();
    }
    public function childListAll(){
        return  $this->hasMany('App\Models\PostConfig', 'parent_id', 'id');
    }
    public function childParent(){
        return $this->belongsTo('App\Models\PostConfig','parent_id');
    }
    public function module(){
        return $this->belongsTo('App\Models\Module','module_id');
    }
    public function gallery(){
        return $this->hasMany('App\Models\PostFile','post_id');
    }

    protected static function boot() {
        parent::boot();
        static::deleting(function($postConfig) { // before delete() method call this
            $postConfig->posts()->delete();
            $postConfig->gallery()->delete();
        });
    }
}
