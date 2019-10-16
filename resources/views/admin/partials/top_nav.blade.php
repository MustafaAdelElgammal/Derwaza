<div class="headerbar">
    <a class="menutoggle"><i class="fa fa-bars"></i></a>
    <a class="toggleFullScreen hidden-sm" onclick="$(document).toggleFullScreen()"><i class="fa fa-arrows-alt"></i></a>
    <a class="toggleFullScreen hidden-sm" href="javascript:void(0)" id="toggle-up"><i class="fa fa-angle-double-up"></i></a>
    <div class="header-right hidden-xs">
        <ul class="headermenu">
            <li>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="{{asset(config('constants.optAdmin.up') . '/avatar/300_300_1556561367_100_100_1501858055_avatar5.png') }}" alt="{{Auth::User()->first_name}}"/>
                        {{ Auth::User()->first_name . " " . Auth::User()->last_name }}
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <li><a href="{{url('admin/profile/settings')}}"  class="load_content_ajax"><i class="fa fa-cog"></i> @lang('admin.account_settings')</a></li>
                        <li><a href="{{url('admin/logout')}}"><i class="fa fa-sign-out"></i> @lang('admin.sign_out')</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
    <div id="progress"></div>
</div>