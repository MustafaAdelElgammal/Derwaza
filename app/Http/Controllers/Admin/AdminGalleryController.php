<?php
namespace App\Http\Controllers\Admin;
use Auth, App\Models\Module, Illuminate\Support\Facades\Session, Illuminate\Support\Facades\Redirect, App\Http\Requests, Illuminate\Http\Request, Illuminate\Support\Facades\Validator;
class AdminGalleryController extends AdminBaseController {

    public function index(){
        return View::make('backEnd.posts.gallery');
    }
    public function getFiles($id){
        $images = Gallery::where('post_id', '=', $id)->get();
        echo json_encode($images);
    }
    public function uploadfile(){
        if ( Input::hasFile('file') ) {
            $file = doUpload(Input::file('file'),'gallery');
            if($file){
                $gallery = new Gallery;
                $gallery->post_id =  Input::get('post_id');
                $gallery->name    =  $file->getFilename();
                $gallery->size    =  Input::get('size');
                $gallery->ext     =  $file->getExtension();
                $gallery->section_id = 'posts' ;
                if($gallery->save()){
                    Session::flash('success','<strong>Well done!</strong> Modules Inserted successfully.');
                    Session::flash('status','success');
                    return json_encode(array('filename'=> $gallery->name ));
                }else{
                    Session::flash('errors','<strong>Oh snap!</strong> Change a few things up and try submitting again.');
                    Session::flash('status','danger');
                    return json_encode(array('filename'=> $gallery->name ));
                }
            }
        }
    }
    public function deletefile ($filename){
        $filePath = public_path().'/uploads/gallery' . '/' . $filename;
        if(file_exists($filePath)) {
            if (unlink($filePath)) {
                $image = Gallery::where('name', '=', $filename)->first();
                if ($image->delete())
                    return "files "  . "( $filename )" . " have been deleted successfully"  ;
            }
        }
        return "ERROR !";
    }
}
