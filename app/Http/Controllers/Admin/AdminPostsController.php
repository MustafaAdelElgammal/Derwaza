<?php
namespace app\Http\Controllers\Admin;
use AdminBaseController, App\Models\Module, App\Models\PostFile, App\Models\Post, App\Models\PostConfig, App\Models\CategoryConfig, Illuminate\Support\Facades\Validator, Illuminate\Http\Request, Session, Redirect, Auth, Helper;
class AdminPostsController extends AdminBaseController {

    public function orderedChange(){
        $id_array  = array_reverse($_POST['order_id']);
        $sort_order = 1;
        foreach($id_array as $id) {
            $p = PostConfig::where('id', $id)->first();
            $p->ordered = $sort_order;
            $p->save();
            $sort_order++;
        }
        if ($this::$isAjax) return response()->json(['message' => trans('admin.post_order_suc')], 200);

        return true;
    }
    public function show($id,Request $request){

        $module = Module::where('slug', '=', $id)->first();
        if($module->have_ordered)
            $posts  = PostConfig::where('module_id' ,'=',$module->id)->orderBy("ordered",'DESC')->paginate(12);
        else
            $posts  = PostConfig::where('module_id' ,'=',$module->id)->paginate(12);

        if($request['page'] != null && $this::$isAjax){
            $return = view('admin.posts.data')->with('module',$module)
            ->with('posts',$posts);
            return response()->json(['html' => $return->render()]);
        }

        return view('admin.posts.index')
            ->with('module',$module)
            ->with('posts',$posts);
    }
    public function createNew($moduleSlug){
        $module     = Module::where('slug', '=', $moduleSlug)->first();
        if($module->have_other_inputs == 1){
            $module->other_inputs = json_decode($module->other_inputs);
        }
        $parents = null;
        if($module->have_parent_module){
            $parent = Module::where('id',$module->parent_module)->first();
            $parents = PostConfig::where('module_id' ,'=',$parent->id)->get();
        }
        return View('admin.posts.create')
                    ->with('post',new Post())
                    ->with('parents',$parents)
                    ->with('module',$module);
    }
    public function edit($module,$id){
        if($id == 'single'){
            $module = Module::where('slug', '=', $module)->first();
            $postConfig = $module->postConfigSingle;
        }else{
            $postConfig = PostConfig::find($id);
        }

        if($postConfig->module->have_other_inputs){
            $postConfig->module->other_inputs = json_decode($postConfig->module->other_inputs);
        }
        $parents = null;
        if($postConfig->module->have_parent_module){
            $parent = Module::where('id',$postConfig->module->parent_module)->first();
            $parents = PostConfig::where('module_id' ,'=',$parent->id)->get();
        }
        return View('admin.posts.edit')
            ->with('postConfig',$postConfig)
            ->with('parents',$parents)
            ->with('module',$postConfig->module);
    }
    public function store(Request $request){

        $input  = $request->input();
        $module = Module::where('id', '=', $input['module_id'])->first();
        $r = $module->rules;
        $rulesArray = array();
        $parent = isset($input['parent_id']) ? $input['parent_id'] : 0;
        if($module->have_parent_module){

            if($module->parent_single){
                $chek = PostConfig::where('module_id' , '=',$module->id)->where('parent_id', '=',$parent)->count();
                if($chek > 0){
                    if ($this::$isAjax) {
                        return response()->json([
                            'validator' => null,
                            'message'   => trans('admin.wrong_error_add_parent')], 400);
                    }
                    Session::flash('message', trans('admin.wrong_error_add_parent'));
                    return Redirect::back();
                }
            }
        }
        if(count($r)){
            foreach($r as $rules)
                foreach($this::$languages as $language)
                    $rulesArray[$rules->rule_key . '_' . $language] = $rules->rule_val ;
        }


        $validator = Validator::make($request->all(), $rulesArray);
        if (!$validator->fails()){


            $PostConfig = new PostConfig;
            $PostConfig->module_id   = $module->id;
            $PostConfig->ordered     = PostConfig::where('module_id',$module->id)->count() + 1 ;
            $PostConfig->status      = isset($input['status']) ? $input['status'] : 1;
            $PostConfig->user_id     = Auth::user()->id;
            $PostConfig->parent_id   = $parent;

            if($PostConfig->save()){
                $module     = $PostConfig->module;
                foreach($this::$languages as $language){
                    $post = new Post ;
                    $post->lang = $language ;
                    $post->config_id = $PostConfig->id;
                    $this->createPost($language, $module, $input, $post);
                };
                if ($this::$isAjax)
                    return response()->json([
                        'message' => trans('admin.post_create_suc'),
                        'with_data' => true,
                        'type' => 'redirect_to',
                        'url_to' => url('admin/posts/'.$module->slug),
                    ], 200);
                Session::flash('success', trans('admin.post_create_suc'));
                return Redirect::back();

            }

        }


        if ($this::$isAjax) {
            return response()->json([
                'validator' => $validator->errors(),
                'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
    public function update($id){
        $input      = Request()->input();
        $PostConfig = PostConfig::find($id);
        $rulesArray = array();
        $module     = $PostConfig->module;
        $parent = isset($input['parent_id']) ? $input['parent_id'] : 0;

        if($module->have_parent_module){
            if($module->parent_single){
                $chek = PostConfig::where('module_id' , '=',$module->id)->where('parent_id', '=',$parent)->first();
                if($chek != null){
                    if($chek->id != $PostConfig->id){
                        if ($this::$isAjax) {
                            return response()->json([
                                'validator' => null,
                                'message'   => trans('admin.wrong_error_add_parent')], 400);
                        }
                        Session::flash('message', trans('admin.wrong_error_add_parent'));
                        return Redirect::back();
                    }
                }
            }
        }
        $r = $module->rules;
        if(count($r)){
            foreach($r as $rules)
                foreach($this::$languages as $language){
                    if (strpos($rules->rule_val_edit, 'unique') !== false) {
                        $rulesArray[$rules->rule_key . '_' . $language] = $rules->rule_val_edit . ',' . $PostConfig->postBySetLang($language)->first()->id ;
                    } else{
                        $rulesArray[$rules->rule_key . '_' . $language] = $rules->rule_val_edit ;
                    }
                }

        }

        $validator = Validator::make(Request()->all(), $rulesArray);
        if (!$validator->fails()){



            $PostConfig->status      = isset($input['status']) ? $input['status'] : 1;
            $PostConfig->parent_id   = $parent;
            if($PostConfig->save()) {
                foreach ($PostConfig->posts as $post) {
                    $this->createPost($post->lang, $module, $input, $post);
                }
                if ($this::$isAjax) return response()->json(['message' => trans('admin.post_update_suc') ], 200);
                Session::flash('success', trans('admin.post_update_suc'));
                return Redirect::back();
            }
        }


        if ($this::$isAjax) {
            return response()->json([
                'validator' => $validator->errors(),
                'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
    public function destroy($id){
        $postCon = PostConfig::find($id);
        if($postCon != null) {
            $module = $postCon->module;
            if(count($postCon->childListAll) != 0){
                if ($this::$isAjax) {
                    return response()->json([
                        'validator' => null,
                        'message'   => trans('admin.wrong_error_delete_related')], 400);
                }
                Session::flash('message', trans('admin.wrong_error_delete_related'));
                return Redirect::back();
            }
            if ($module->have_thumbnail){
                $ds = DIRECTORY_SEPARATOR;
                $sizes  = explode('&',preg_replace('/[^A-Za-z0-9\+&_]/', '', '300_300&'.$module->thumbnail_sizes));
                $path = "upload" . $ds . "posts" . $ds . $module->slug;
                foreach($postCon->posts as $post){
                   Helper::deleteFile($post->upload, $path, $sizes);
                }
            }

            if($postCon->delete()){
                if ($this::$isAjax) return response()->json(['message' => trans('admin.post_del_suc')], 200);
                Session::flash('message', trans('admin.post_del_suc'));
                return Redirect::back();
            }
        }
        if ($this::$isAjax) {
            return response()->json(['validator' => null,'message'   => trans('admin.wrong_error')], 400);}

        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back();
    }

    private function createPost($lang,$module,$input,$post){

        $name    = isset($input['name_'.$lang])    ? $input['name_'.$lang] : "" ;
        $details = isset($input['details_'.$lang]) ? $input['details_'.$lang] : "" ;
        $short   = isset($input['short_'.$lang])   ? $input['short_'.$lang] : "" ;
        $keys    = isset($input['keys_'.$lang])    ? $input['keys_'.$lang] : "" ;
        $desc    = isset($input['desc_'.$lang])    ? $input['desc_'.$lang] : "" ;

        $post->name = $name ;

            $post->slug = $lang == 'ar' ? str_replace(' ', '-',trim($name))
                : mb_strtolower(str_replace(' ', '-', trim($name.' ')));

        $post->details = $details ;
        $post->short   = $short ;
        $post->keys    = $keys ;
        $post->desc    = $desc ;
        $post->views   = 0;

        if ($module->have_other_inputs == 1)
            $post->other_inputs_values = $this->createJson($post->lang, json_decode($module->other_inputs), $input,$module->slug,$post->other_inputs_values);
        if($upload = Request()->file('upload_'.$lang)){
            $ds = DIRECTORY_SEPARATOR;
            $sizes =  explode('&',preg_replace('/[^A-Za-z0-9\+&_*]/', '', '300_300&' . $module->thumbnail_sizes));
            $path = "upload" . $ds . "posts" . $ds . $module->slug;
            if ($post->id != null && $post->upload != "")
                Helper::deleteFile($post->upload, $path, $sizes);
            $image = Helper::doUploadImage($upload,'posts'. $ds .$module->slug,$sizes);
            $post->upload  = $image;
        }
        $post->save();
    }
    private function createJson($language,$otherInputs,$req_input,$moduleSlug, $other_inputs_values){

        foreach ($otherInputs as $otherInput) {
            $type  = $otherInput->type ;
            $key   = $otherInput->key ;
            $input = $key .'_' . $language;
            if($type == 'image'){
                if($upload = Request()->file($input)){
                    $sizes =  explode('&',preg_replace('/[^A-Za-z0-9\+&_*]/', '', '300_300&'.$otherInput->sizes));
                    $image = Helper::doUploadImage($upload,'posts/'.$moduleSlug,$sizes);
                    $value = $image;
                }else if($other_inputs_values != null){
                    $value = $other_inputs_values->$key ;
                }else{
                    $value = "";
                }
            }else if($type == 'file'){
                if ($file  = Request()->file($input)) {
                    $value = Helper::doUploadFile($file, 'posts/'.$moduleSlug . '/files');
                }else if($other_inputs_values != null){
                    $value = $other_inputs_values->$key ;
                }else{
                    $value = "";
                }
            }else{
                $value = $req_input[$input];
            }
            $fieldsPost[0][$key] = $value;
        }
        return json_encode($fieldsPost , JSON_HEX_QUOT);
    }

    public function postGallery($postId){
        $post = PostConfig::find($postId);
        return view('admin.posts.gallery')->with('post',$post);

    }
    public function getPostGallery($postId){
        $images = PostFile::where('post_id', '=', $postId)->get();
        echo json_encode($images);
    }
    public function addPostGallery($postId,Request $request){
        if($upload = $request->file('file')){
            $post = PostConfig::find($postId);
            $ds   = DIRECTORY_SEPARATOR;
            $path = 'posts' . $ds . $post->module->slug . $ds . 'gallery';
            $image = Helper::doUploadImage($upload, $path);
            if($image){
                $postFile = new PostFile;
                $postFile->post_id =  $postId;
                $postFile->name    =  $image;
                $postFile->size    =  "";
                $postFile->ext     = '';
                $postFile->section = $post->module->slug ;
                if($postFile->save()){
                    if ($this::$isAjax)
                    return response()->json([
                        'message'  => trans('admin.post_del_suc'),
                        'filename' => $postFile->name
                    ], 200);
                }
            }
        }
    }
    public function delPostGallery($postId, $filename){
        $post  = PostConfig::find($postId);
        $image = PostFile::where('name', '=', $filename)->where('post_id', '=', $post->id)->first();
        if ($image->delete())
            return "files has been deleted successfully"  ;
        return "ERROR !";
    }
    public function uploadSummer(Request $request){
        if($upload = $request->file('file')){
            $path = 'posts' . DIRECTORY_SEPARATOR . 'summer';
            $image = Helper::doUploadImage($upload, $path);
            if($image){
            if ($this::$isAjax)
                return response()->json([
                    'message'  => trans('admin.post_file_done'),
                    'filename' => url('public/upload/posts/summer/' . $image)
                ], 200);
            }
        }
    }
}
