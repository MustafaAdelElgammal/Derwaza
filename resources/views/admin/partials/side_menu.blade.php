<div class="logopanel"><h1><span>[</span> administrator <span>]</span></h1></div>
<div class="leftpanelinner">
    <div class="hidden-md hidden-lg">
        <div class="media userlogged">
            <img alt="" src="{{asset(config('constants.optAdmin.up') . '/avatar'.'/100_100_' . Auth::User()->avatar) }}" class="media-object">
            <div class="media-body">
                <h4>{{Auth::User()->first_name . " " . Auth::User()->last_name}}</h4>
                <span>{{Auth::User()->email}}</span>
            </div>
        </div>

        <h5 class="sidebartitle actitle">@lang('admin.account')</h5>
        <ul class="nav nav-pills nav-stacked nav-bracket mb30">
            <li><a href="{{url('admin/profile/settings')}}"  class="load_content_ajax"><i class="fa fa-cog"></i><span> @lang('admin.account_settings')</span></a></li>
            <li><a href="{{url('admin/logout')}}"><i class="fa fa-sign-out"></i><span> @lang('admin.sign_out')</span></a></li>
        </ul>
    </div>
    <h5 class="sidebartitle">@lang('admin.navigation')</h5>
    <ul class="nav nav-pills nav-stacked nav-bracket">

        <li class="@if(Request::segment(2) == '') active @endif"><a href="{{url('admin')}}" class="load_content_ajax"><i class="fa fa-home"></i><span> @lang('admin.dashboard')</span></a></li>
        <li class="@if(Request::segment(2) == 'configuration') active @endif"><a href="{{url('admin/configuration')}}"  class="load_content_ajax"><i class="fa fa-cogs"></i><span> @lang('admin.configurations')</span></a></li>
        {{--@if(in_array(Auth::User()->role_id, [2, 1]))--}}
             {{--<li class="nav-parent @if(Request::segment(2) == 'users') nav-active active @endif"><a href="#"><i class="fa fa-users"></i> <span>@lang('admin.users')</span></a>--}}
                 {{--<ul class="children" style="@if(Request::segment(2) == 'users') display:block @endif">--}}
                     {{--<li class="@if(Request::segment(2) == 'users' && Request::segment(3) == '') active @endif"><a href="{{url('admin/users')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.all_users')</a></li>--}}
                     {{--<li class="@if(Request::segment(2) == 'users' && Request::segment(3) == 'create') active @endif"><a href="{{url('admin/users/create')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.create_new_user')</a></li>--}}
                     {{--@if(Auth::User()->role_id == 1)--}}
                         {{--<li class="@if(Request::segment(2) == 'permissions') active @endif"><a href="{{url('admin/permissions')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.users_permissions')</a></li>--}}
                     {{--@endif--}}
                 {{--</ul>--}}
             {{--</li>--}}
        {{--@endif--}}
         @foreach($menuItems as $item)
             @if($item->show_menu)
                 @if($item->single)
                     <li class="@if(Request::segment(3) == $item->slug) active @endif"><a href="{{url('admin/posts/'. $item->slug . '/single/edit')}}" class="load_content_ajax"><i class="fa {{ $item->icon }}"></i> <span>{{$item->name_en}}</span></a></li>
                 @elseif(!$item->have_add_new)
                     <li class="@if(Request::segment(3) == $item->slug) active @endif"><a href="{{url('admin/posts/'. $item->slug)}}" class="load_content_ajax"><i class="fa {{ $item->icon }}"></i> <span>{{$item->name_en}}</span></a></li>
                 @else
                     <li class="nav-parent @if(Request::segment(3) == $item->slug) nav-active active @endif"><a href="#"><i class="fa {{ $item->icon }}"></i> <span>{{$item->name_en}}</span></a>
                         <ul class="children" style="@if(Request::segment(3) == $item->slug) display:block @endif">
                             <li class="@if(Request::segment(2) == 'modules' && Request::segment(3) == $item->slug &&Request::segment(4) == '') active @endif"><a href="{{url('admin/posts/'.$item->slug)}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.all') {{$item->$name}}</a></li>
                             <li class="@if(Request::segment(2) == 'modules' && Request::segment(3) == $item->slug &&Request::segment(4) == 'create') active @endif"><a href="{{url('admin/posts/'.$item->slug . '/create')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.create')</a></li>
                             {{--@if($item->slug == 'slider')--}}
                                 {{--<li class="@if(Request::segment(2) == 'posts' && Request::segment(3) == 'slider_text') active @endif"><a href="{{url('admin/posts/slider_text/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> Slider Text</a></li>--}}
                             {{--@endif--}}
                         </ul>
                     </li>
                 @endif
             @endif
         @endforeach
        <li class="nav-parent @if(Request::segment(2) == 'branches') nav-active active @endif"><a href="#"><i class="fa fa-users"></i> <span>Branches</span></a>
            <ul class="children" style="@if(Request::segment(2) == 'branches') display:block @endif">
                <li class="@if(Request::segment(2) == 'branches' && Request::segment(3)  == '') active @endif"><a href="{{url('admin/branches')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.all_branches')</a></li>
                <li class="@if(Request::segment(2) == 'branches' && Request::segment(3)  == 'create') active @endif"><a href="{{url('admin/branches/create')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.create_branches')</a></li>
            </ul>
        </li>
        {{--<li class="nav-parent @if(in_array(Request::segment(3), ['about', 'term_and_condition', 'privacy_policy', 'our_mission'])) nav-active active @endif"><a href="#"><i class="fa fa-users"></i> <span>Static Pages</span></a>--}}
            {{--<ul class="children" style="@if(in_array(Request::segment(3), ['about', 'term_and_condition', 'privacy_policy'])) display:block @endif">--}}
                {{--<li class="@if(Request::segment(3) == 'about' && Request::segment(2)  == 'posts') active @endif"><a href="{{url('admin/posts/about/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> About Us</a></li>--}}
                {{--<li class="@if(Request::segment(3) == 'term_and_condition' && Request::segment(2)  == 'posts') active @endif"><a href="{{url('admin/posts/term_and_condition/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> Term And Condition</a></li>--}}
                {{--<li class="@if(Request::segment(3) == 'privacy_policy' && Request::segment(2)  == 'posts') active @endif"><a href="{{url('admin/posts/privacy_policy/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> Privacy Policy</a></li>--}}
            {{--</ul>--}}
        {{--</li>--}}
        <li class="nav-parent @if(in_array(Request::segment(3), ['about', 'term_and_condition', 'privacy_policy', 'our_mission'])) nav-active active @endif"><a href="#"><i class="fa fa-users"></i> <span>About Company</span></a>
            <ul class="children" style="@if(in_array(Request::segment(3), ['about', 'term_and_condition', 'privacy_policy'])) display:block @endif">
                <li class="@if(Request::segment(3) == 'our_mission' && Request::segment(2)  == 'posts') active @endif"><a href="{{url('admin/posts/our_mission/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i>Mission and Vission</a></li>
                <li class="@if(Request::segment(3) == 'certificates' && Request::segment(2)  == 'posts') active @endif"><a href="{{url('admin/posts/certificates/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i>Certificates</a></li>
                <li class="@if(Request::segment(3) == 'chairmans_message' && Request::segment(2)  == 'posts') active @endif"><a href="{{url('admin/posts/chairmans_message/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i>Chairman's Message</a></li>
                <li class="@if(Request::segment(3) == 'organization_chart' && Request::segment(2)  == 'posts') active @endif"><a href="{{url('admin/posts/organization_chart/single/edit')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i>Organization Chart</a></li>
            </ul>
            </li>

    @if(Auth::User()->role_id == 1)
             <li class="nav-parent @if(Request::segment(2) == 'modules') nav-active active @endif"><a href="#"><i class="fa fa-shield"></i><span> @lang('admin.modules')</span></a>
                 <ul class="children" style="@if(Request::segment(2) == 'modules') display:block @endif">
                     <li class="@if(Request::segment(2) == 'modules' && Request::segment(3) == '') active @endif"><a href="{{url('admin/modules')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.all_modules')</a></li>
                     <li class="@if(Request::segment(2) == 'modules' && Request::segment(3) == 'create') active @endif"><a href="{{url('admin/modules/create')}}" class="load_content_ajax"><i class="fa fa-caret-right"></i> @lang('admin.create_new_module')</a></li>
                 </ul>
             </li>
         @endif
    </ul>
    <div class="infosummary">
        <ul><li><div class="datainfo"></div></li></ul>
    </div>
</div>
