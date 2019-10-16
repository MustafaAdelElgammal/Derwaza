<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Admin, App\Http\Controllers, App\Http\Requests, Illuminate\Http\Request, Illuminate\Support\Facades\Hash, Illuminate\Support\Facades\Validator, App\Models\User, Auth, Helper, Session, Redirect;
class AdminProfileController  extends AdminBaseController{

    public function showMyProfile(Request $request){
        return view('admin.profile.profile')->with('user',Auth::User());
    }
    public function editMyProfile(Request $request){
        return view('admin.profile.profile_edit')->with('user',Auth::User());
    }
    public function saveMyProfile(Request $request){
        $user = User::find(Auth::user()->id);
        $validator = Validator::make($request->all(), User::$rules_user_edit);

        if (!$validator->fails()){
            $user->first_name = $request['first_name'];
            $user->last_name  = $request['last_name'];
            $user->gender     = $request['gender'];

            if ($user->save()) {
                if ($request->ajax())
                    return response()->json(['message' => trans('admin.pro_main_suc')], 200);
                Session::flash('message', trans('admin.pro_main_suc'));
                return Redirect::back();
            }
        }

        if ($request->ajax()) {
            return response()->json([
                'validator' => $validator->errors(),
                'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);

    }
    public function setMyPassword(Request $request){
        $validator = Validator::make($request->all(),User::$rules_password);
        if(!$validator->fails()) {
            $user = User::find(Auth::user()->id);
            $user->password = bcrypt($request['password']);
            if ($user->save()) {
                if ($request->ajax())
                    return response()->json(['message' => trans('admin.pro_pass_suc')], 200);
                Session::flash('success', trans('admin.pro_pass_suc'));
                return Redirect::back();
            }
        }


        if ($request->ajax()) {
            return response()->json(array(
                'validator' => $validator->errors(),
                'message' => trans('admin.wrong_error'),
            ),400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
    public function changeMyEmail(Request $request){
        $validator = Validator::make($request->all(),User::$rules_change_email);
        if(!$validator->fails()){

            $user = User::find(Auth::user()->id);
            $user->email = $request['email'] ;
            if ($user->save()) {
                if ($request->ajax())
                    return response()->json(['message' => trans('admin.pro_mail_suc')], 200);
                Session::flash('message', trans('admin.pro_mail_suc'));
                return Redirect::back();
            }
        }

        if ($request->ajax()) {
            return response()->json(array(
                'validator' => $validator->errors(),
                'message' => trans('admin.wrong_error'),
            ),400);
        }
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
}
