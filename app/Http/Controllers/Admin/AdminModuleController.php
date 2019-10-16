<?php
namespace App\Http\Controllers\Admin;
use Auth, App\Models\Module, Illuminate\Support\Facades\Session, Illuminate\Support\Facades\Redirect, App\Http\Requests, Illuminate\Http\Request, Illuminate\Support\Facades\Validator;
class AdminModuleController extends AdminBaseController{
    public function index(){
        return view('admin.modules.index')->with('modules', Module::orderBy('order_menu','ASC')->get());
    }
    public function create(){
        return view('admin.modules.create')->with('modulesList', Module::pluck('name_en','id')->all());
    }
    public function edit($id){
        $module = Module::find($id);
        $modulesList = Module::pluck('name_en','id')->all();
        $module->aliases = $module->alias;
        $module->ruleses = $module->rules;
        if ($module->have_other_inputs == 1) {
            $fieldsPost = json_decode($module->other_inputs );
            $module->other_inputs = $fieldsPost;
        }else{
            $module->other_inputs = null;
        }
        return view('admin.modules.edit')->with('module',$module)->with('modulesList', $modulesList);
    }
    public function store(Request $request){
        $validator = Validator::make($request->all(), Module::$rulesCreate);
        if (!$validator->fails()){
            $input  = $request->input();
            $module = new Module;
            if($this->save($module,$input))
                Session::flash('success','<strong>Well done!</strong> Modules Inserted successfully.');
            else
                Session::flash('wrong','<strong>Oh snap!</strong> Change a few things up and try submitting again.');
        }

        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withErrors($validator);
    }
    public function update($id, Request $request){
        $module = Module::find($id);
        $this->validate($request, Module::$rulesEdit);
        $input = Request()->input();
        if($this->save($module,$input))
            Session::flash('success','<strong>Well done!</strong> Modules Inserted successfully.');
        else
            Session::flash('errors','<strong>Oh snap!</strong> Change a few things up and try submitting again.');
        return Redirect::back();
    }
    public function destroy($id){
        if(Module::find($id)->delete())
            Session::flash('success', '<strong>Well done!</strong> Module Deleted successfully.');
        return Redirect::back();
    }
    private function save($module , $input ){

        $module->name_en    = ucfirst (strtolower($input['name_en']));
        $module->name_ar    = trim($input['name_ar']);
        $module->view_style = trim($input['view_style']);
        $module->icon  = strtolower($input['icon']);
        if($module->id == null)
            $module->slug  = strtolower(str_replace(' ', '_', trim($input['name_en'])));
        $module->have_name       = isset($input['have_name']);
        $module->have_short      = isset($input['have_short']);
        $module->have_details    = isset($input['have_details']);
        $module->have_thumbnail  = isset($input['have_thumbnail']);
        $module->thumbnail_sizes = isset($input['thumbnail_sizes']) ? $input['thumbnail_sizes'] : "";
        $module->have_gallery    = isset($input['have_gallery']);
        $module->have_add_new    = isset($input['have_add_new']);
        $module->have_seo        = isset($input['have_seo']);
        $module->have_ordered    = isset($input['have_ordered']);
        $module->have_status     = isset($input['have_status']);
        $module->single          = isset($input['single']);

        $module->alias  = $this->createAliasJson($input['alias_key'], $input['alias_en' ], $input['alias_ar' ]);
        $module->rules  = $this->createRulesJson($input['rules_key'], $input['rules_val'], $input['rules_val_edit']);


        if($module->have_parent_module = isset($input['have_parent_module'])){
            $module->parent_module     = $input['parent_module'];
        }
        if($module->show_menu   = isset($input['show_menu'])){
            $module->order_menu = $input['order_menu'];
        }
        if(isset($input['have_other_inputs_update'])){
            if(isset($input['have_other_inputs'])){
                $keys       = $input['other_input_key'];
                $types      = $input['other_input_type'];
                $names_en   = $input['other_input_name_en'];
                $names_ar   = $input['other_input_name_ar'];
                $options_en = $input['other_input_options_en'];
                $options_ar = $input['other_input_options_ar'];
                $class      = $input['other_input_class'];
                $sizes      = $input['other_input_sizes'];

                if(count($keys) == 0){
                    $module->other_inputs  = null ;
                    $module->have_other_inputs = 0;
                }else{
                    $module->other_inputs      = $this->createJson($keys,$types,$names_en, $names_ar,$class,$sizes,$options_ar,$options_en) ;
                    $module->have_other_inputs = 1;
                };
            }else{
                $module->have_other_inputs = 0;
                $module->other_inputs  = null ;
            }
        }
        return $module->save() ? true : false ;
    }
    private function createJson($keys,$types,$names_en, $names_ar,$class,$sizes,$options_ar,$options_en){

        $num = count($types) ;
        $fieldsPost = array();
        for($i=1; $i< $num; $i++){
            $input = new \stdClass();
            $input->key        = $keys[$i] ;
            $input->type       = $types[$i]  ;
            $input->name_en    = $names_en[$i];
            $input->name_ar    = $names_ar[$i];
            $input->class      = $class[$i];
            $input->sizes      = $sizes[$i];
            $input->options_en = $options_en[$i];
            $input->options_ar = $options_ar[$i];
            if($input->type != '' && $input->key != '')
                $fieldsPost[] = $input;
        }
        return json_encode($fieldsPost , JSON_HEX_QUOT);
    }
    private function createAliasJson($keys,$names_en, $names_ar){
        $num = count($keys) ;
        $fieldsPost = array();
        for($i=0; $i< $num; $i++){
            $input = new \stdClass();
            $input->name_en = $names_en[$i];
            $input->name_ar = $names_ar[$i];
            $fieldsPost[$keys[$i]] = $input;
        }
        $fieldsPosts [] = $fieldsPost;
        return json_encode($fieldsPosts , JSON_HEX_QUOT );
    }
    private function createRulesJson($keys, $rules, $rulesEdit){
        $num = count($keys) ;
        $fieldsPost = array();
        if($num >0)
            for($i=0; $i< $num; $i++){
                if($keys[$i] != "" && $rules[$i] != ""){
                    $rule = new \stdClass();
                    $rule->rule_key   = $keys[$i];
                    $rule->rule_val = $rules[$i];
                    $rule->rule_val_edit = $rulesEdit[$i];
                    $fieldsPost[$i-1] = $rule;
                }
            }
        $fieldsPosts[] = $fieldsPost;
        return json_encode($fieldsPosts , JSON_HEX_QUOT );
    }
}
