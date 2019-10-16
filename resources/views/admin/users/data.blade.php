@if(!empty($users))
    @foreach($users as $user)
        <div class="col-md-6 sort-root">
            <div class="people-item">
                <div class="media">
                    <a href="javascript:void(0)" class="pull-left">
                        <img alt="" src="{{asset(config('constants.optAdmin.up') . '/avatar/300_300_1556561367_100_100_1501858055_avatar5.png')}}" class="thumbnail media-object">
                    </a>
                    <div class="media-body">
                        <h4 class="person-name">{{ $user->first_name . ' ' . $user->last_name }}</h4>
                        <div class="text-muted"><i class="fa fa-archive"></i> {{ $user->email }}</div>
                        <div class="text-muted"><i class="fa fa-archive"></i> {{ $user->role->$name }}</div>
                        <div class="text-muted"><i class="fa fa-archive"></i> <span id="{{'change_status_span_' . $user->id}}"> @lang($user->is_active ? 'admin.active' : 'admin.not_active')</span></div>
                        <ul class="social-list">
                            <li><a href="{{ URL::to('admin/users/' . $user->id . '/edit') }}" class="load_content_ajax tooltips load_content_ajax" data-toggle="tooltip" data-placement="top" title="@lang('admin.edit')"><i class="fa fa-cog"></i></a></li>
                            {{--<li>--}}
                                {{--{{ Form::open(array('route' => array('admin.users.destroy', $user->id), 'method' => 'delete','class'=>"delete-ajax")) }}--}}
                                {{--<button  class="btn-white tooltips" data-toggle="tooltip" data-placement="top" title="@lang('admin.delete')" type="submit"><i class="fa fa-trash-o"></i></button>--}}
                                {{--{{ Form::close() }}--}}
                            {{--</li>--}}
                            <li>
                                {{ Form::open(array('route' => array('admin.users.change_status', $user->id), 'method' => 'post', 'class' => "submit-ajax general-form", 'id' => 'change_status_' . $user->id)) }}
                                <button class="btn-white make_active_user_btn {{$user->is_active == 0 ? '' : 'hidden'}}" type="submit" style=" width: 100%; "><i class="fa fa-bitbucket-square"></i> <span style="font-size: 12px">Activate Account</span></button>
                                <button class="btn-white make_inactive_user_btn {{$user->is_active == 1 ? '' : 'hidden'}}" type="submit" style=" width: 100%; color: red "><i class="fa fa-bitbucket-square"></i> <span style="font-size: 12px">Deactivate Account</span></button>
                                {{ Form::close() }}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
    <div class="col-md-12 pagination-parent">
        {!! with(new App\Pagination\AcmePresenter($users))->render() !!}
    </div>
@endif
