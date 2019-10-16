<?php
namespace App\Http\Middleware;
use Closure, Session, Auth, App\Models\Configuration;

class Localization {
    public function handle($request, Closure $next) {
        if($request->segment(1) == 'admin') {
            $lang = Configuration::select('site_admin_lang')->where('config_lang','=','config')->first()->site_admin_lang;
            app()->setLocale($lang);
        }else{
            $configuration = Configuration::select('site_lang_default', 'site_status')->where('config_lang','=','config')->first();
            if(!Session::has('locale')) {
                if($request->segment(1) == '') {
                    Session::put('locale', $configuration->site_lang_default);
                    \LaravelLocalization::setLocale($configuration->site_lang_default);
                    app()->setLocale($configuration->site_lang_default);
                }elseif(\LaravelLocalization::getCurrentLocale() != '' && \LaravelLocalization::getCurrentLocale() != $configuration->site_lang_default){
                    Session::put('locale', \LaravelLocalization::getCurrentLocale());
                    app()->setLocale(\LaravelLocalization::getCurrentLocale());
                }else{
                    Session::put('locale', $configuration->site_lang_default);
                }
            }else{
                if($request->segment(1) == '' || $request->segment(1) == 'change-branch') {
                    \LaravelLocalization::setLocale(Session::get('locale'));
                    app()->setLocale(Session::get('locale'));
                }elseif(\LaravelLocalization::getCurrentLocale() != '' && \LaravelLocalization::getCurrentLocale()  != Session::get('locale')){
                    Session::put('locale', \LaravelLocalization::getCurrentLocale());
                    app()->setLocale(\LaravelLocalization::getCurrentLocale());
                }
            }
            if($configuration->site_status == 0) {
               if($request->segment(1))
                    return redirect()->to('');
            }
        }
        return $next($request);
    }
}