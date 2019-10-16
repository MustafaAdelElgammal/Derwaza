<?php
namespace App\Http\Controllers\Admin;
use App\Models\Dish;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Models\Region, App\Models\Branch;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
class AdminBranchesController extends AdminBaseController {

    /**
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\View\View
     * @throws \Throwable
     */
    public function index(Request $request) {

        $regions = Region::orderBy('name_en', 'asc')->get();
        $branches = Branch::orderBy('name_en', 'desc')->paginate(20)->appends($request->input());
        if($request['page'] != null && $this::$isAjax){
            $return = view('admin.branches.data')->withBranches($branches);
            return response()->json(['html' => $return->render()]);
        }
        return view('admin.branches.index')->withBranches($branches)->withRegions($regions);
    }

    /**
     * @return $this|\Illuminate\Http\JsonResponse
     */
    public function create() {
//        $dishes    = Dish::orderBy('id', 'asc')->get();
        $regions = Region::orderBy('name_en', 'asc')->get();
        return view('admin.branches.create')->withRegions($regions)->withBranch(null);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function store(Request $request) {

        $result = $this->setBranch($request, null);
        if($result['status'] == true){
            if($this::$isAjax)
                return response()->json(
                    [
                        'with_data' => true,
                        'type' => 'redirect_to',
                        'url_to' => url('admin/branches'),
                        'message' => trans('admin.item_add_suc')
                    ], 200);
            Session::flash('success', trans('admin.item_add_suc'));
            return Redirect::back();
        }
        if ($this::$isAjax) return response()->json([
            'validator' => $result['data']->errors(),
            'message' => trans('admin.item_add_error')
        ], 400);
        Session::flash('message', trans('admin.item_add_error'));
        return Redirect::back()->withInput()->withErrors($result['data']);
    }

    /**
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\JsonResponse|\Illuminate\View\View
     */
    public function edit($id) {
//        $dishes    = Dish::orderBy('id', 'asc')->get();
        $regions = Region::orderBy('name_en', 'asc')->get();
        $branch = Branch::find($id);
        return view('admin.branches.edit')
//            ->withDishes($dishes)
            ->withBranch($branch)
            ->withRegions($regions);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id){

        $branch = Branch::find($id);
        if($branch) {
            if ($branch->is_default == 1) {
                if($request->is_active == 0){
                    if ($this::$isAjax)
                        return response()->json(['validator' => null, 'message' => 'Default branch can\'t be make unpublished'], 400);
                    Session::flash('message', trans('admin.item_edit_error'));
                    return Redirect::back();
                }
            }
        }

        $result = $this->setBranch($request, intval($id)) ;
        if($result['status'] == true){
            if ($this::$isAjax)
                return response()->json([
                    'message' => trans('admin.item_edit_suc')
                ], 200);
            Session::flash('success', trans('admin.item_edit_suc'));
            return Redirect::back();
        }
        if ($this::$isAjax)
            return response()->json([
                'validator' => $result['data']->errors(),
                'message' => trans('admin.item_edit_error')
            ], 400);
        Session::flash('message', trans('admin.item_edit_error'));
        return Redirect::back()->withInput()->withErrors($result['data']);

    }

    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id){
        $branches = Branch::all();
        $branch = Branch::find($id);
        if($branch->type == 1 || $branch->is_default == 1){
            if ($this::$isAjax)
                return response()->json(['validator' => null,'message' => 'Default branch can\'t deleting'],400);
            Session::flash('message', trans('admin.item_del_error'));
            return Redirect::back();
        }
        if(count($branches) < 2){
            if ($this::$isAjax)
                return response()->json(['validator' => null,'message' => 'this branch can\'t deleting'],400);
            Session::flash('message', trans('admin.item_del_error'));
            return Redirect::back();
        }
        if($branch!=null){
            if($branch->delete()){
                if ($this::$isAjax)
                    return response()->json(['message' => trans('admin.item_del_suc')], 200);
                Session::flash('message', trans('admin.item_del_suc'));
                return Redirect::back();
            }
        }
        if ($this::$isAjax)
            return response()->json(['validator' => null,'message' => trans('admin.item_del_error')],400);
        Session::flash('message', trans('admin.item_del_error'));
        return Redirect::back();
    }

    /**
     * @param $request
     * @param $id
     * @return array
     */
    public function setBranch($request, $id){

        $validator = Validator::make($request->all(), ($id == null) ? Branch::$rules_create : Branch::$rules_edit);
        if ($validator->fails()){
            return ['status' => false , 'data' => $validator];
        }
        $branch = ($id == null) ? new Branch : Branch::find($id);
        $branch->region_id  = intval($request->region);
        $branch->is_active  = $request->is_active;

        $branches = Branch::all();
        if($branches->count() == 0){
            $branch->is_active = 1;
            $branch->is_default = 1;
        }

        $branch->email    = strip_tags($request->email);
        $branch->phone      = $request->phone;
        $branch->phones     = mb_substr(json_encode($request->phones, JSON_HEX_QUOT), 1, -1);
        $branch->name_ar    = strip_tags($request->name_ar);
        $branch->name_en    = strip_tags($request->name_en);
        $branch->address_ar = strip_tags($request->address_ar);
        $branch->address_en = strip_tags($request->address_en);
        $branch->latitude   = $request->latitude;
        $branch->longitude  = $request->longitude;

        if($branch->save()){
            return ['status' => true , 'data' => $branch];
        }
        return ['status' => false , 'data' => $validator];

    }

    function makeDefault($branchId){
        $currentBranch  = Branch::find($branchId);
        if($currentBranch->type != 0 || $currentBranch->is_active == 0){
            if ($this::$isAjax)
                return response()->json([
                    'validator' => [],
                    'message' => 'Default branch can\'t be set to un publish branch please make this branch publish and try again.'
                ], 400);
        }
        $previousBranch = Branch::whereIsDefault(1)->first();
        $currentBranch->is_default = 1;

        if ($currentBranch->save()){
            $previousBranch->is_default = 0;
            $previousBranch->save();
            if ($this::$isAjax)
                return response()->json([
                    'message' => 'Default Branch changed successfully',
                    'with_data' => true,
                    'type' => 'change_default_branch',
                    'current_branch' => $currentBranch->id,
                    'previous_branch' => $previousBranch->id,
                    'status' => 'change_default_branch'
                ], 200);

            Session::flash('success', 'Default Branch changed successfully');
            return Redirect::back();
        }
        if ($this::$isAjax)
            return response()->json([
                'validator' => [],
                'message' => 'wrong error'
            ], 400);
        Session::flash('message', 'wrong error');
        return Redirect::back()->withInput();
    }
}
