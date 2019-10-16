<?php
namespace App\Http\Controllers\Web;
use Illuminate\Http\Request, Illuminate\Support\Facades\Validator, Auth, Session, Redirect, App\Models\User, App\Models\Region, App\Models\PasswordReset;
class WebUserController extends WebBaseController {
    public function index(){
        return view('site.user.index');
    }
    public function register() {
        return view('site.auth.register')->withCities(Region::getAllCities());
    }
    public function postRegister(Request $request){
        $validator = Validator::make($request->all(),User::$visitor_rules);
        if (!$validator->fails()){
            $user = new User ;
            if ($user->createNewUserAsCustomer($request)) {
//                $user['link'] = str_random(30);
//                \Mail::send('site.auth.activation_mail', $user, function($message) use ($user) {
//                    $message->to(trim($user->email));
//                    $message->subject(trans('web.from') . ' ' . trim($this->config->site_name) .' : ' . trans('web.activation_code'));
//                });
                Session::flash('stat', 'done');
                Session::flash('message', trans('web.user_create_suc'));

                $method = array('email' => $request->email, 'password' => $request->password);
                Auth::attempt($method);
                if($request->get_from != null) {
                    return response()->json([
                        'validator' => null,
                        'url'       => $request->get_from,
                        'message'   => trans('web.user_create_suc')
                    ], 200);
                }else{
                    return response()->json([
                        'validator' => null,
                        'url' => url('/'),
                        'message' => trans('web.user_create_suc')
                    ],200);
                }
            }
        }
        if ($this::$isAjax)
            return response()->json([
                'validator' => $validator->errors(),
                'message' => trans('web.user_create_error')
            ],400);
        Session::flash('stat', 'error');
        Session::flash('message', trans('web.user_create_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
    public function activation(){
        return view('site.auth.activation');
    }
    public function login() {
        return view('site.auth.login');
    }
    public function postLogin(Request $request ) {
        $input = $request->input();
        $rules = array('email_login' => 'required|email|exists:users,email', 'password_login' => 'required');
        $validator = Validator::make($request->all(), $rules);
        if (!$validator->fails()){
            $method = array('email' => $input['email_login'], 'password' => $input['password_login']);
            if (Auth::attempt($method)) {
                if (!Auth::user()->is_active || Auth::user()->role_id != 4) {
                    Auth::logout();
                    return Redirect::back()->withInput();
                }else {
                    if($request->get_from != null) {
                        return Redirect::back();
                    }else{
                        return Redirect::to('/');
                    }
                }
            }
            Session::flash('stat', 'danger');
            Session::flash('message', trans('web.user_login_error'));
            return Redirect::back()->withInput();
        }else {
            Session::flash('stat', 'danger');
            Session::flash('message', trans('web.user_login_error'));
            return Redirect::back()->withInput()->withErrors($validator);
        }
    }
    public function logout() {
        Auth::logout();
        return redirect('/user/login');
    }
    public function resetPassword() {
        return view('site.auth.email');
    }
    public function resetCode($code){
        $PasswordReset = PasswordReset::where('token',$code)->first();
        if(!$PasswordReset){
            return view('site.auth.expired_link');
        }
        return view('site.auth.reset')->with('code',$code);
    }
    public function postResetLast(Request $request ,$code){
        $rules = array('password' => 'required|min:6|max:12|same:confirmPassword', 'confirmPassword' => 'required|same:password');
        $validator = Validator::make($request->all(), $rules);
        if (!$validator->fails()){
            $PasswordReset = PasswordReset::where('token',$code)->first();
            if($PasswordReset){
                $user = User::where('email',$PasswordReset->email)->first();
                if($user!=null){
                    $user->password = bcrypt($request['password']);
                    if ($user->save()) {
                        $PasswordReset->delete();
                        Session::flash('stat', 'success');
                        Session::flash('message', trans('web.password_reset_done_complete'));
                        return Redirect::to('user/login');
                    }
                }
            }
            Session::flash('stat', 'danger');
            Session::flash('message', trans('web.password_reset_link_expire'));
            return Redirect::back();
        }
        Session::flash('stat', 'danger');
        Session::flash('message', trans('web.password_reset_err'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
    public function postResetPassword(Request $request){
        $validator = Validator::make($request->all(), ['email'=>'required|email|exists:users,email']);
        if (!$validator->fails()){

            $user = User::where('email',$request['email'])->first();

            if($user!=null){
                $data['name']  = $user->first_name . ' ' . $user->last_name;
                $data['email'] = $user->email;
                $data['link'] = str_random(30);
                PasswordReset::where('email', $user->email)->delete();
                $PasswordReset = new PasswordReset;
                $PasswordReset->token = $data['link'];
                $PasswordReset->email = $data['email'];
                $PasswordReset->save();

                \Mail::send('site.auth.reset_mail', $data, function($message) use ($data) {
                    $message->to($data['email']);
                    $message->from('no-reply@healthybarkw.com');
                    $message->subject(trans('web.from') . ' ' . trim($this->config->site_name) .' : ' . trans('web.rest_pass_mail'));
                });
                Session::flash('stat', 'success');
                Session::flash('message', trans('web.password_reset_done'));
                return Redirect::back();

            }
            Session::flash('stat', 'danger');
            Session::flash('message', trans('web.main_error'));
            return Redirect::back()->withInput();
        }

        Session::flash('stat', 'danger');
        Session::flash('message', trans('web.main_error'));
        return Redirect::back()->withInput()->withErrors($validator);

    }
    public function editMyProfile(){
        $cities = Region::getAllCitiesAvailableList('ar');
        $areas  = Region::getAllAreasAvailableList('ar', Auth::user()->subscription->city_id);
        $return = view('site.user.profile_edit')->with('areas', $areas)->with('cities', $cities)->with('user',Auth::User());
        return $return;
    }
    public function saveMyProfile(Request $request){
        $user = User::find(Auth::user()->id);
        $validator = Validator::make($request->all(), User::$rules_user_edit);
        if (!$validator->fails()){
            $user->first_name = $request['first_name'];
            $user->last_name  = $request['last_name'];
            $user->gender     = $request['gender'];
            $user->avatar     = ($user->gender  == 0) ? "default_avatar_male.png" : "default_avatar_female.png";
            $user->area_id    = $request['area_id'];
            $user->address    = $request['address'];
            $user->phone      =  $request['phone'] ;
            if ($user->save()) {
                if ($request->ajax())
                    return response()->json(['message' => trans('admin.pro_main_suc')], 200);
                Session::flash('stat', 'done');
                Session::flash('message', trans('admin.pro_main_suc'));
                return Redirect::back();
            }
        }
        if ($request->ajax()) {
            return response()->json([
                'validator' => $validator->errors(),
                'message' => trans('admin.wrong_error')],400);
        }
        Session::flash('stat', 'error');
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
                Session::flash('stat', 'done');
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
        Session::flash('stat', 'error');
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
                Session::flash('stat', 'done');
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
        Session::flash('stat', 'error');
        Session::flash('message', trans('admin.wrong_error'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
    public function makeSuggestion(Request $request){
        $valid_code = random_int(352418,999999);
        $return = view('site.user.make_suggestion')->with('valid_code', $valid_code)->with('user',Auth::User());
        return $return;
    }
    public function makeSuggestionPost(Request $request){
        $validator = Validator::make($request->all(),Suggestion::$rules);
        if (!$validator->fails()){

            $sug          = new Suggestion;
            $sug->user_id =  Auth::user()->id;
            $sug->title   = $request['title'];
            $sug->note    = $request['note'];
            if ($sug->save()) {
                Session::flash('stat', 'done');
                Session::flash('message', trans('web.suggestion_form_done'));
                return Redirect::back();
            }

        }
        Session::flash('stat', 'error');
        Session::flash('message', trans('web.suggestion_form_err'));
        return Redirect::back()->withInput()->withErrors($validator);
    }
}
