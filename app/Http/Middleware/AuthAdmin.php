<?php
namespace App\Http\Middleware;
use Closure;
use Illuminate\Support\Facades\Auth;
class AuthAdmin{
    public function handle($request, Closure $next, $guard = null){
        if(Auth::guard($guard)->guest()){
            if($request->ajax() || $request->wantsJson()) {
                return response('Unauthorized.', 401);
            }else{
                return redirect()->guest('admin/login');
            }
        }else{
            if(Auth::User()->role_id == 4){
                return redirect()->to('/user/my_account');
            }
        }
        return $next($request);
    }
}