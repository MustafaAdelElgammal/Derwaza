<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Admin, App\Http\Controllers, App\Http\Requests, Illuminate\Http\Request, Illuminate\Support\Facades\Validator, App\Models\User, App\Models\Role, App\Models\BaseModel, Auth, Helper, Session, Redirect;
class AdminUserController extends AdminBaseController {

    public function index(Request $request) {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        $users  = User::orderBy('id', 'desc')->where('role_id', '!=' ,1)->where('id', '!=', Auth::User()->id)->paginate(20);

        if($request['page'] != null && $this::$isAjax){
            $return = view('admin.users.data')->with('users', $users);
            return response()->json(['html' => $return->render()]);
        }

        return view('admin.users.index')->with('users', $users);
    }
    public function create() {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        return view('admin.users.create')->with('user', null)->with('roles', Role::where('id','!=',1)->lists('name_'.BaseModel::$language, 'id')->all());
    }
    public function permissions() {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        return view('admin.users.permissions');
    }
    public function edit($id) {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        $user = User::find($id);
        if($user->role_id != 1){
            return view('admin.users.edit')->with('user', $user)->with('roles', Role::where('id','!=',1)->lists('name_'.BaseModel::$language, 'id')->all());
        }
        return redirect('admin/users');
    }
    public function store(Request $request) {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        $validator = Validator::make($request->all(),User::$rules);
        if (!$validator->fails()){
            $input = $request;
            $user = new User;
            $user->email = $input['email'];
            $user->role_id = $input['role_id'];
            $user->is_active = $input['is_active'];
            $user->password = bcrypt($input['password']);
            $user->first_name = $input['first_name'];
            $user->last_name = $input['last_name'];
            $user->gender = $input['gender'];
            $user->avatar = ($user->gender == 0) ? "default_avatar_male.png" : "default_avatar_female.png";
            if($avatar = $input->file('avatar')){
                $avatar = Helper::doUploadImage($avatar,'avatar',['100_100' , '300_300']);
                $user->avatar = $avatar;
            }
            if ($user->save()) {
                if ($this::$isAjax)
                    return
                        response()->json([
                            'with_data' => true,
                            'type' => 'redirect_to',
                            'url_to' => url('admin/users'),
                            'message' => trans('admin.user_add_suc')
                        ], 200);

                Session::flash('success', trans('admin.user_add_suc'));
                Session::flash('status', 'success');
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
    public function update($id, Request $request) {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        $input = $request;
        $user  = User::find($id);
        $validator = null;
        if($user->role_id != 1){
            if ($user->email != $input['email']){
                if (isset($input['change_password']))
                    $validator = Validator::make($request->all(), User::$rules_edit_with_password_email);
                else
                    $validator = Validator::make($request->all(), User::$rules_edit_with_email);
            }else{
                if (isset($input['change_password']))
                    $validator = Validator::make($request->all(), User::$rules_edit_with_password);
                else
                    $validator = Validator::make($request->all(), User::$rules_edit);
            }
            if (!$validator->fails()){
//                $user->email      = $input['email'];
//                $user->role_id    = $input['role_id'];
                $user->is_active  = $input['is_active'];
//                $user->first_name = $input['first_name'];
//                $user->last_name  = $input['last_name'];
//                $user->gender     = $input['gender'];

                if($avatar = $input->file('avatar')){
                    $avatar = Helper::doUploadImage($avatar,'avatar',['100_100' , '300_300']);
                    $user->avatar     = $avatar;
                }

                if (isset($input['change_password']))
                    $user->password = bcrypt($input['password']);

                if ($user->save()) {
                    if ($this::$isAjax)
                        return response()->json(['message' => trans('admin.user_edit_suc')], 200);
                    Session::flash('success', trans('admin.user_edit_suc'));
                    Session::flash('status', 'success');
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
        if ($this::$isAjax) {
            return response()->json([
                'validator' => null,
                'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput();
    }
    public function destroy($id) {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        $user = User::find($id) ;
        if($user->role_id != 1){
            $path = "upload" . DIRECTORY_SEPARATOR . "avatar";
            Helper::deleteFile($user->avatar, $path, ['100_100' , '300_300']);
            if ($user->delete()) {
                if ($this::$isAjax) return response()->json(['message' => trans('admin.user_del_suc')], 200);
                Session::flash('message', trans('admin.user_del_suc'));
                return Redirect::back();
            }
        }
        if ($this::$isAjax) {
            return response()->json([
                'validator' => null,
                'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back();
    }
    public function changeStatus($userId) {
        if(!in_array(Auth::User()->role_id, [2, 1])){
            return redirect('admin');
        }
        //users/change_status/{user_id}
        $user = User::find($userId);
        $user->is_active = $user->is_active == 0 ? 1 : 0;
        if($user->save()){
            if ($this::$isAjax)
                return response()->json([
                    'message' => 'user status changed successfully',
                    'with_data' => true,
                    'type' => 'user_change_status',
                    'user_id' => $user->id,
                    'status' => $user->is_active == 1 ? 'active' : 'inactive'
                ], 200);
            Session::flash('message', 'user status changed successfully');
            return Redirect::back();
        }
        if ($this::$isAjax) {
            return response()->json([
                'validator' => null,
                'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back();
    }
}
