<?php

namespace App\Http\Middleware;
use Closure;
use Illuminate\Support\Facades\Auth;

class AuthRoot{
    public function handle($request, Closure $next, $guard = null){
        if(Auth::User()->role_id != 1){
            return redirect('admin');
        }
        return $next($request);
    }
}
