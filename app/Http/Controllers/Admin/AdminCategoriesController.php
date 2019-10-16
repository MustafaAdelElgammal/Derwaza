<?php
namespace App\Http\Controllers\Admin;
use Helper, Validator, Session, Redirect, Illuminate\Http\Request;
use App\Models\Categories;
class AdminCategoriesController  extends AdminBaseController {

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\View\View
     */
    public function index(){
        $categories = Categories::orderBy('id', 'desc')->paginate(20);
        return view('admin.categories.index', compact('categories'));
    }
    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\View\View
     */
    public function create(){
        $currentCategory = null;
        return view('admin.categories.create', compact(['currentCategory']));
    }
    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\View\View
     */
    public function edit($id){
        $currentCategory = Categories::find($id);
        return view('admin.categories.edit', compact(['currentCategory']));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request){

        $inputs  = $request->input();
        $inputs['slug_ar'] = Helper::generateArabicSlug($request->slug_ar);
        $inputs['slug_en'] = Helper::generateEnglishSlug($request->slug_en);
        $validator = Validator::make($inputs,Categories::$rules);

        if (!$validator->fails()){
            $category = new Categories;
            if($this->saveCategoryData($category, $request)){

                if ($this::$isAjax)
                    return response()->json([
                            'with_data' => true,
                            'type'      => 'redirect_to',
                            'url_to'    => url('admin/categories'),
                            'message'   => trans('admin.category_add_suc')
                        ], 200);

                Session::flash('success', trans('admin.category_add_suc'));
                Session::flash('status', 'success');
                return Redirect::back();
            }
        }
        if ($this::$isAjax) {
            return response()->json(['validator' => $validator->errors(), 'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }

    /**
     * @param Request $request
     * @param $category_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $category_id){

        $inputs  = $request->input();
        $inputs['slug_ar'] = Helper::generateArabicSlug($request->slug_ar);
        $inputs['slug_en'] =  Helper::generateEnglishSlug($request->slug_en);
        $rules = Categories::$rules;
        $rules['name_ar'] = $rules['name_ar'] . ',' . $category_id;
        $rules['name_en'] = $rules['name_en'] . ',' . $category_id;
        $rules['slug_ar'] = $rules['slug_ar'] . ',' . $category_id;
        $rules['slug_en'] = $rules['slug_en'] . ',' . $category_id;
        $validator = Validator::make($inputs, $rules);

        if (!$validator->fails()){
            $category = Categories::find($category_id);
            if($this->saveCategoryData($category, $request)){
                if ($this::$isAjax)
                    return response()->json(['message' => trans('admin.category_edit_suc')], 200);
                Session::flash('success', trans('admin.category_edit_suc'));
                Session::flash('status', 'success');
                return Redirect::back();
            }
        }
        if ($this::$isAjax)
            return response()->json(['validator' => $validator->errors(), 'message' => trans('admin.wrong_error')],400);
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }

    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id){
        $categories = Categories::find($id);
        if($categories != null){
            if($categories->dishes->count()>0){
                if ($this::$isAjax)
                    return response()->json(['validator' => null, 'message' => trans('admin.snaperror')],400);
            }else{
                if($categories->delete()){
                    if ($this::$isAjax) return response()->json(['message' => trans('admin.actegory_del_suc')], 200);
                    Session::flash('message', trans('admin.actegory_del_suc'));
                    return Redirect::back();
                }
            }
        }else{
            Session::flash('errors',trans('admin.snaperror'));
            Session::flash('status','danger');
        }
    }
    /**
     * @param Categories $category
     * @param Request $request
     * @return bool
     */
    private function saveCategoryData(Categories $category, Request $request){

        $category->parent_id = 0;
        $category->is_side   = isset($request->is_side) ? 1 : 0 ;
        $category->name_ar   = trim($request->name_ar) ;
        $category->name_en   = trim($request->name_en) ;
        $category->slug_ar   = Helper::generateArabicSlug($request->slug_ar);
        $category->slug_en   =  Helper::generateEnglishSlug($request->slug_en);
        if($category->save())
            return true;
        return false;
    }
    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function orderedChange(){
        $id_array  = array_reverse($_POST['order_id']);
        $sort_order = 1;
        foreach($id_array as $id) {
            $p = MentalPeacesPart::where('id', $id)->first();
            $p->ordered = $sort_order;
            $p->save();
            $sort_order++;
        }
        if ($this::$isAjax)
            return response()->json(['message' => trans('admin.mental_parts_order_suc')], 200);
    }
}
