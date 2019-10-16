<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Configuration;
use App\Models\Module;
use Session, Request;
use App\Models\BaseModel;
class AdminBaseController extends Controller{
    public static $languages ;
    public static $siteConfig ;
    public static $isAjax ;
    public function __construct(){
        $this::$siteConfig = Configuration::select('id', 'site_lang', 'site_lang_default', 'site_phone', 'site_email', 'site_keyword', 'site_status','site_admin_lang','config_lang','social')->where('config_lang','=','config')->first();
        $this::$languages = explode(',',$this::$siteConfig->site_lang);
        $lang = $this::$siteConfig->site_admin_lang ;
        view()->share('lang', $lang);
        BaseModel::$language = in_array($lang, $this::$languages) ? $lang : $this::$siteConfig->site_lang_default ;
        view()->share('languages', $this::$languages);
        view()->share('siteConfig', $this::$siteConfig);
        view()->share('name', 'name_'.$lang);
        view()->share('image', 'image_'.$lang);
        view()->share('menuItems', Module::orderBy('order_menu','ASC')->select('id', 'name_'.$lang,'slug','icon','single','show_menu','have_add_new')->get());
        if(Request()->ajax()){
            view()->share('layout', 'main_layout');
            $this::$isAjax = true ;
        }else{
            view()->share('layout', 'main_layout');
            $this::$isAjax = false ;
        }
    }
}
