@if(!empty($categories))
    @foreach($categories as $category)
        <div class="col-md-6 sort-root">
            <div class="people-item">
                <div class="media">
                    <div class="media-body">
                        <h4 class="person-name">{{ $category->name_ar }}</h4>
                        <ul class="social-list">
                            <li><a href="{{ URL::to('admin/categories/'. $category->id .'/edit' ) }}" class="load_content_ajax tooltips -load_content_ajax" data-toggle="tooltip" data-placement="top" title="@lang('admin.edit')"><i class="fa fa-cog"></i></a></li>
                            <li>
                                {{ Form::open(array('route' => array('admin.categories.destroy', $category->id), 'method' => 'delete','class'=>"delete-ajax")) }}
                                    <button  class="btn-white tooltips" data-toggle="tooltip" data-placement="top" title="@lang('admin.delete')" type="submit"><i class="fa fa-trash-o"></i></button>
                                {{ Form::close() }}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
    <div class="col-md-12 pagination-parent">
        {!! with(new App\Pagination\AcmePresenter($categories))->render() !!}
    </div>
@endif
