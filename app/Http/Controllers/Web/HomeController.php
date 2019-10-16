<?php

namespace App\Http\Controllers\Web;

use App\Models\Branch;
use Session, Redirect, App\Models\Module, App\Models\PostConfig, App\Models\Dish, Illuminate\Http\Request, Illuminate\Support\Facades\Validator, Auth;
use App\Models\Cart;
use App\Models\Post;

class HomeController extends WebBaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index(Request $request){

        if($this->config->main->site_status == '0'){
            return view('site.errors.undercon');
        }

        $sliders = PostConfig::where('module_id', '=', Module::where('slug', '=', 'slider')->first()->id)->whereStatus(0)
            ->get();
        $chairmans_message = PostConfig::where('module_id', '=', Module::where('slug', '=', 'chairmans_message')->first()->id)
            ->get();
        $sectors = PostConfig::where('module_id','=' ,Module::whereSlug('sectors')->first()->id)->whereStatus(0)->get();
        view()->share('sectors',  $sectors);
        $missions = PostConfig::where('module_id', '=',Module::whereSlug('our_mission')->first()->id)->get();
        view()->share('missions',  $missions);
//        $news = PostConfig::where('module_id', '=', Module::where('slug', '=', 'news')->first()->id)->whereStatus(0)
//            ->orderBy('created_at','DESC')->limit(4)->get();
        return view('site.pages.home')
            ->with('sliders', $sliders)
            ->with('chairmans_message', $chairmans_message)
            ->with('$ectors', $sectors);
//            ->with('news', $news);
    }
    public function sectors(Request $request){

        return view('site.components.sectors')->with('request',$request);
    }

    public function sectorsDetails(Request $request){

        $sliders = PostConfig::where('module_id', '=', Module::where('slug', '=', 'slider')->first()->id)
            ->get();
        $sectors = PostConfig::where('module_id','=' ,Module::whereSlug('sectors')->first()->id)->whereStatus(0)->get();
        view()->share('sectors',  $sectors);
        return view('site.pages.sectorsDetails')->with('sliders', $sliders)->with('sectors', $sectors)->with('request',$request)
        ;
    }
    public function oneSectorDetails(Request $request){
        $sector =  Post::whereSlug($request->slug)->first();
        $sectors = PostConfig::where('module_id', '=', Module::whereSlug('sectors')->first()->id)->whereStatus(0)->get();
        return view('site.pages.one-sector-details')->with('sector', $sector)->with('sectors', $sectors)->with('request',$request);
    }
    public function about(Request $request){
        $chairmans_message = PostConfig::where('module_id', '=', Module::where('slug', '=', 'chairmans_message')->first()->id)->get();
        $missions = PostConfig::where('module_id', '=',Module::whereSlug('our_mission')->first()->id)->get();
        $certificates =PostConfig::where('module_id', '=',Module::whereSlug('certificates')->first()->id)->get();
        $organization_chart = PostConfig::where('module_id', '=',Module::whereSlug('organization_chart')->first()->id)->get();

        return view('site.pages.about')->with('missions',$missions)->with('chairmans_message',$chairmans_message)->with('organization_chart',$organization_chart)->with('certificates',$certificates)->with('request',$request);
    }
//    public function news(Request $request){
//        $news = PostConfig::where('module_id', '=', Module::where('slug', '=', 'news')->first()->id)->whereStatus(0)
//            ->orderBy('created_at','DESC')->paginate(10);
//        return view('site.pages.news')->with('news',$news)->with('request',$request);
//    }
//    public function newsDetails(Request $request){
//        $new =  Post::whereSlug($request->slug)->first();
//        $news = PostConfig::where('module_id', '=', Module::where('slug', '=', 'news')->first()->id)->whereStatus(0)
//            ->get();
//        return view('site.pages.one-news-details')->with('new', $new)->with('news', $news)->with('request',$request);
//    }

//
    public function contact(Request $request)
    {
        $sliders = PostConfig::where('module_id', '=', Module::where('slug', '=', 'slider')->first()->id)
            ->get();
        return view('site.pages.contact')->with('sliders', $sliders)->with('request',$request);
    }
//
    public function contactPost(Request $request)
    {
        $contactPostRules = [
            'email' => 'required|email|max:255',
            'full_name' => 'required|max:255',
            'subject' => 'required|max:500',
        ];
        $validator = Validator::make($request->all(), $contactPostRules);
        if (!$validator->fails()) {
            $input = $request;
            $data['email'] = $input['email'];
            $data['full_name'] = $input['full_name'];
            $data['subject'] = $input['subject'];
//            $data['message'] = $input['message'];
            \Mail::send('site.components.send_contact_mail', $data, function ($message) use ($data) {
                $message->from($data['email'], $data['full_name']);
                $message->to(trim($this->config->main->site_email));
                $message->replyTo($data['email'], $data['full_name']);
                $message->subject(trim($this->config->site_name));
            });

            Session::flash('flash_message_done', trans('thank you ! your message has been sent successfully'));
            Session::flash('flash_message_done_ar', trans('شكرا لك تم ارسال الرسالة بنجاح'));
            return Redirect::back();
        }
        Session::flash('flash_message_error', trans('web.all_fields_required'));

        return Redirect::back()->withInput()->withErrors($validator);
    }

    public function changeLanguage($lang, Request $request)
    {

        $url   = url()->previous();
        $url_explode = explode("/",$url);
        $url_explode[3] = $lang;
        $redir = implode('/',$url_explode);
        if (isset($url_explode[5])){
            $post =  Post::whereSlug(urldecode($url_explode[5]))->first();
            $allposts =  Post::whereConfigId($post->config_id)->whereLang($lang)->first();
//        dd($lang,$allposts);
//        dd( redirect($url_explode[3].'/'.$url_explode[4].'/'.urldecode($url_explode[5])));
            return redirect($url_explode[3].'/'.$url_explode[4].'/'.$allposts->slug);
        }
//        $post =  Post::whereSlug(urldecode($url_explode[5]))->first();
//        $allposts =  Post::whereConfigId($post->config_id)->whereLang($lang)->first();
//        dd($lang,$allposts);
//        dd( redirect($url_explode[3].'/'.$url_explode[4].'/'.urldecode($url_explode[5])));
//        return redirect($url_explode[3].'/'.$url_explode[4].'/'.$allposts->slug);
        return redirect($redir);
    }

    public function errors()
    {
        return view('site.pages.errors');
    }
}

