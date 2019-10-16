<?php
namespace app\Http\Controllers\Web;
use Session;
use App\Http\Controllers\Controller,
    App\Models\BaseModel,
    App\Models\Configuration,
    App\Models\Module,App\Models\Branch,
    App\Models\PostConfig;

class WebBaseController extends Controller{
    public $config;
    public $currentBranch;
    public static $isAjax;

    public function __construct(){
        $lang = Session::get('locale');
        BaseModel::$language = $lang;
        view()->share('lang', $lang);
        view()->share('name', 'name_' . $lang);

        $this->config = Configuration::where('config_lang', '=', $lang)->first();
        $this->config->main = Configuration::where('config_lang', '=', 'config')->first();
        $this->config->social = Configuration::select('social')->where('config_lang', '=', 'config')->first()->social;
        view()->share('config', $this->config);
        view()->share('img', asset('public/web/img'));
        view()->share('css', asset('public/web/css'));
        view()->share('js', asset('public/web/js'));
        view()->share('up', asset('public/upload'));
        view()->share('fonts', asset('public/web/fonts'));
        view()->share('vendors', asset('public/web/vendors'));

        view()->share('branches', Branch::whereType(0)->whereIsActive(1)->get());
        view()->share('headBranch', Branch::whereType(1)->first());

        $this->currentBranch = Session::get('branch') === null ? Branch::whereIsDefault(1)->whereType(0)->first() :  Session::get('branch') ;
        view()->share('current_branch', $this->currentBranch);
//        $sliders = PostConfig::where('module_id','=' ,Module::whereSlug('sliders')->first()->id)->get();
//        view()->share('sliders',  $sliders);
        $sliderText = PostConfig::where('module_id','=' ,Module::whereSlug('slider_text')->first()->id)->get();
        view()->share('sliderText',  $sliderText);
        $sectors = PostConfig::where('module_id','=' ,Module::whereSlug('sectors')->first()->id)->get();
        view()->share('sectors',  $sectors);
//        $news = PostConfig::where('module_id','=' ,Module::whereSlug('news')->first()->id)->get();
//        view()->share('news',  $news);
//        $contacts = PostConfig::where('module_id','=' ,Module::whereSlug('contact')->first()->id)->get();
//        view()->share('contacts',  $contacts);
        $chairmans_message = PostConfig::where('module_id','=' ,Module::whereSlug('chairmans_message')->first()->id)->get();
        view()->share('chairmans_message',  $chairmans_message);

        $clients = PostConfig::where('module_id','=' ,Module::whereSlug('clients')->first()->id)->get();
        view()->share('clients',  $clients);

        $this::$isAjax = Request()->ajax() ? true : false;
    }
}
