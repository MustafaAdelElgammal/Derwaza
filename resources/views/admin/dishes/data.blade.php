@if(!empty($dishes))
    @foreach($dishes as $dish)
        <div class="col-md-6 sort-root">
            <div class="people-item">
                <div class="media">
                    <a href="javascript:void(0)" class="pull-left">
                        <img alt="" src="{{asset(config('constants.optAdmin.up') . '/dishes/616_362_'. $dish->$image)}}" class="thumbnail media-object">
                    </a>
                    <div class="media-body">
                        <div class="text-muted"><i class="fa fa-archive"></i> {{ $dish->name_ar }}</div>
                        <div class="text-muted"><i class="fa fa-archive"></i> {{ $dish->category->name_ar }}</div>
                        <small class="text-muted"><i class="fa fa-{{$dish->is_active == 1 ? 'square' : 'square-o'}}"></i> @lang($dish->is_active == 1 ? 'admin.published' : 'admin.not_published')</small>
                        <ul class="social-list">
                            <li><a href="{{ URL::to('admin/dishes/'. $dish->id .'/edit' ) }}" class="load_content_ajax tooltips" data-toggle="tooltip" data-placement="top" title="@lang('admin.edit')"><i class="fa fa-cog"></i></a></li>
                            <li>
                                {{ Form::open(array('route' => array('admin.dishes.destroy', $dish->id), 'method' => 'delete','class'=>"delete-ajax")) }}
                                    <button  class="btn-white tooltips" data-toggle="tooltip" data-placement="top" title="@lang('admin.delete')" type="submit"><i class="fa fa-trash-o"></i></button>
                                {{ Form::close() }}
                            </li>
                            <li>
                                {{ Form::open(array('route' => array('admin.dishes.add_to_popular', $dish->id), 'method' => 'post','class'=>"submit-ajax general-form", 'id' => 'popular_' . $dish->id)) }}
                                        <button class="btn-white add_to_popular_btn {{$dish->is_popular == 0 ? '' : 'hidden'}}" type="submit" style=" width: 100%; "><i class="fa fa-bitbucket-square"></i> <span style="font-size: 12px">Add to popular</span></button>
                                        <button class="btn-white remove_from_popular_btn {{$dish->is_popular == 1 ? '' : 'hidden'}}" type="submit" style=" width: 100%; color: red "><i class="fa fa-bitbucket-square"></i> <span style="font-size: 12px">Remove from popular</span></button>
                                {{ Form::close() }}
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
    <div class="col-md-12 pagination-parent">
        {!!with(new App\Pagination\AcmePresenter($dishes))->render()!!}
    </div>
@endif
