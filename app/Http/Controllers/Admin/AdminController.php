<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Support\Facades\Request, AdminBaseController, Auth, Session, Redirect;
use phpDocumentor\Reflection\DocBlock\Tags\See;

class AdminController extends AdminBaseController {
    public function index() {

        return view('admin.dashboard.index');
    }
    public function help() {
        return view('admin.dashboard.help');
    }
    public function login() {
        return view('admin.dashboard.login');
    }
    public function logout() {
        Auth::logout();
        Session::flush();
        return redirect('/admin');
    }
    public function doLogin() {
        $input = Request()->input();
        $method = array('email' => $input['email'], 'password' => $input['password']);
        if (Auth::attempt($method)) {
            if (!Auth::user()->is_active) {
                Auth::logout();
                return Redirect::back()->withInput()->withErrors(['login_error' => 'this user is inactive']);
            } else {
                return redirect()->intended('admin');
            }
        } else {
            return Redirect::back()->withErrors('اسم المستخجم او كلمه مرور غير صحيحه');
        }
    }
}
