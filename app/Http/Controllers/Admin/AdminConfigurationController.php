<?php
namespace App\Http\Controllers\Admin;
use App\Models\Configuration, Session,  Redirect, Request;
class AdminConfigurationController extends AdminBaseController {

    public function index(){
        $siteConfigs = Configuration::where('config_lang', '!=', 'config')->get();
        $selectedLang = [trans('admin.select_language')] ;
        foreach($this::$languages as $language) {
            $selectedLang[$language] = trans('admin.'.$language);
        }
        return view('admin.dashboard.config')->with('selectedLang',$selectedLang)->with('siteConfigs', $siteConfigs);
    }
    public function updateSiteLanguage(){
        $inputs = Request()->input();
        $config = Configuration::Where('config_lang', '=', 'config')->firstOrFail();
        $config->site_lang_default = $inputs['site_lang_default'];
        $config->save();
        if ($this::$isAjax)
            return response()->json(['message' => trans('admin.site_lang_suc')], 200);
        else{
            Session::put('message', trans('admin.site_lang_suc'));
            return Redirect::to('admin/configuration');
        }
    }
    public function updateSiteStatus(){
        $input  = Request()->input();
        $config = Configuration::Where('config_lang', '=', 'config')->firstOrFail();
        $config->site_status = isset( $input['site_status'] ) ? $input['site_status'] : 1;
        $config->save();
        if ($this::$isAjax)
            return response()->json(['message' => trans('admin.status_suc')], 200);
        else{
            Session::put('message', trans('admin.status_suc'));
            return Redirect::to('admin/configuration');
        }
    }
    public function updateMain(){
        $input = Request()->input();
        $configuration = Configuration::Where('config_lang', '=', 'config')->firstOrFail();
        $configuration->site_email = $input['site_email'];
        $configuration->site_phone = $input['site_phone'];
        //$configuration->site_fax = $input['site_fax'];
        $configuration->save();
        $siteConfigLang = explode(',', $configuration->site_lang);
        if (count($siteConfigLang) > 0) {
            foreach ($siteConfigLang as $site) {
                $update = Configuration::where('config_lang', '=', $site)->first();
                $update->site_name = $input['site_name_' . $site];
                $update->save();
            };
            if ($this::$isAjax)
                return response()->json(['message' => trans('admin.conf_suc')], 200);
            else{
                Session::put('message', trans('admin.conf_suc'));
                return Redirect::to('admin/configuration');
            }
        }
        Session::put('message', trans('admin.wrong_error'));
        return Redirect::to('admin/configuration');
    }
    public function updateSiteSeo(){
        $input = Request()->input();
        $configuration = Configuration::Where('config_lang', '=', 'config')->firstOrFail();
        $siteConfigLang = explode(',', $configuration->site_lang);
        if (count($siteConfigLang) > 0) {
            foreach ($siteConfigLang as $site) {
                $update = Configuration::where('config_lang', '=', $site)->first();
                $update->site_desc = $input['site_desc_' . $site];
                $update->save();
            };
            if ($this::$isAjax)
                return response()->json(['message' => trans('admin.conf_suc')], 200);
            else{
                Session::put('message', trans('admin.conf_suc'));
                return Redirect::to('admin/configuration');
            }
        }
        Session::put('message', trans('admin.wrong_error'));
        return Redirect::to('admin/configuration');
    }
    public function updateSiteGoogleAnalysisScript(){
        $input  = Request()->input();
        $config = Configuration::Where('config_lang', '=', 'config')->firstOrFail();
        $config->site_keyword = isset( $input['site_keyword'] ) ? $input['site_keyword'] : '';
        $config->save();
        if ($this::$isAjax)
            return response()->json(['message' => trans('admin.status_suc')], 200);
        else{
            Session::put('message', trans('admin.status_suc'));
            return Redirect::to('admin/configuration');
        }
    }
    public function updateSocial() {

        $input = Request()->input();
        $sites = $input['social_site'];
        $links = $input['social_link'];
        $fieldsPost = [];

        for($i=1; $i< count($sites); $i++) {
            $fieldsVal['site'] = $sites[$i];
            $fieldsVal['link'] = $links[$i];
            $fieldsPost[$i]    = $fieldsVal;
        }

        $update = Configuration::where('config_lang', '=', 'config')->first();
        $update->social = $fieldsPost;
        $update->save();

        if ($this::$isAjax) return response()->json(['message' => trans('admin.social_suc')], 200);
        else{
            Session::put('message', trans('admin.social_suc'));
            return Redirect::to('admin/configuration');
        }
    }

}
