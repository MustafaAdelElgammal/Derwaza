<?php
namespace App\Models;
use App\Models\BaseModel, Helper;
class PostFile extends BaseModel{
    public $timestamps = false ;
    public function postConfig(){
        return $this->belongsTo('App\Models\PostConfig','post_id','id');
    }
    protected static function boot() {
        parent::boot();
        static::deleting(function($postFile) { // before delete() method call this
            $ds   = DIRECTORY_SEPARATOR;
            $path = "upload" . $ds . 'posts' . $ds . $postFile->section . $ds . 'gallery';
            Helper::deleteFile($postFile->name, $path);
        });
    }
}
