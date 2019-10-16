@if(!empty($branches))
    @foreach($branches as $branch)
        <div class="col-md-6 sort-root">
            <div class="people-item">
                <div class="media">
                    <div class="media-body">
                        <div class="text-muted"><i class="fa fa-archive"></i> {{ $branch->{$name} }}</div>
                        <small class="text-muted"><i class="fa fa-{{$branch->is_active == 1 ? 'square' : 'square-o'}}"></i> @lang($branch->is_active == 1 ? 'admin.published' : 'admin.not_published')</small>
                        <ul class="social-list">
                            <li><a href="{{ URL::to('admin/branches/'. $branch->id .'/edit' ) }}" class="load_content_ajax tooltips load_content_ajax" data-toggle="tooltip" data-placement="top" title="@lang('admin.edit')"><i class="fa fa-cog"></i></a></li>
                            @if($branch->type == 0)
                                <li>
                                    {{ Form::open(array('route' => array('admin.branches.destroy', $branch->id), 'method' => 'delete','class'=>"delete-ajax")) }}
                                    <button  class="btn-white tooltips" data-toggle="tooltip" data-placement="top" title="@lang('admin.delete')" type="submit"><i class="fa fa-trash-o"></i></button>
                                    {{ Form::close() }}
                                </li>
                                {{--<li>--}}
                                    {{--{{ Form::open(array('route' => array('admin.branches.make_default', $branch->id), 'method' => 'post', 'class' => "submit-ajax general-form", 'id' => 'make_default_' . $branch->id)) }}--}}
                                    {{--<button class="btn-white make_default_branch_btn {{$branch->is_default == 0 ? '' : 'hidden'}}" type="submit" style=" width: 100%; "><i class="fa fa-bitbucket-square"></i> <span style="font-size: 12px">Set as default branch</span></button>--}}
                                    {{--<button class="btn-white is_default_branch_btn {{$branch->is_default == 1 ? '' : 'hidden'}}" disabled type="reset" style=" width: 100%; color: red "><i class="fa fa-bitbucket-square"></i> <span style="font-size: 12px">Default Branch</span></button>--}}
                                    {{--{{ Form::close() }}--}}
                                {{--</li>--}}
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
    <div class="col-md-12 pagination-parent">
        {!!with(new App\Pagination\AcmePresenter($branches))->render()!!}
    </div>
@endif