@if($module->view_style == 'style_1')
    @if(count($posts))
    @foreach($posts as $post)
        @if(isset($post->postByLang))
            <div class="col-sm-6 col-md-4 sort-root">
                <div class="panel panel-default widget-photoday">
                    <div class="panel-body">
                        @if($module->have_thumbnail)
                            <a href="javascript:void(0)" class="photoday"><img src="{{asset(config('constants.optAdmin.up') . '/posts/'.$module->slug . '/300_300_' .$post->postByLang->upload)}}" alt="" class="img-responsive" style="height:100px; -o-object-fit: contain;"></a>
                        @endif
                        <div class="photo-details">
                            <h4 class="photo-title">{{str_limit($post->postByLang->name , 20)}}</h4>
                            @if($module->have_parent_module)
                                <small class="text-muted"><i class="fa fa-book"></i> {{$post->childParent->postByLang->name}}</small>
                            @endif
                            @if($module->have_status)
                                <small class="text-muted"><i class="fa fa-{{$post->status == 0 ? 'square' : 'square-o'}}"></i> @lang($post->status == 0 ? 'admin.published' : 'admin.not_published')</small>
                            @endif
                        </div><!-- photo-details -->
                        <ul class="photo-meta">
                            <li><a href="{{ URL::to('admin/posts/'.$module->slug.'/' . $post->id . '/edit') }}" class="load_content_ajax" ><i class="fa fa-edit"></i> @lang('admin.edit')</a></li>
                            @if($module->have_add_new == 1)
                                <li>
                                    {{ Form::open(array('route' => array('admin.posts.destroy', $post->id), 'method' => 'delete','class'=>'delete-ajax')) }}
                                        <button  class="btn-white btn-block" type="submit"><i class="fa fa-trash-o"></i> @lang('admin.delete')</button>
                                    {{ Form::close() }}
                                </li>
                            @endif
                            @if($module->have_ordered)
                                <li>
                                    <input type="text" name="order_id[]" value="{{$post->id}}" class="hidden">
                                    <a href="#" class="sort-button"><i class="fa fa-sort"></i> @lang('admin.sort')</a>
                                </li>
                            @endif
                        </ul>
                    </div><!-- panel-body -->
                </div><!-- panel -->
            </div>
        @endif
    @endforeach
    <div class="col-md-12 pagination-parent">
        {!! with(new App\Pagination\AcmePresenter($posts))->render() !!}
    </div>
    @endif
@elseif($module->view_style == 'style_2')
    @if(count($posts))
    @foreach($posts as $post)
       @if(isset($post->postByLang))
        <div class="col-md-6  sort-root">
            <div class="people-item">
                <div class="media">
                    <a href="javascript:void(0)" class="pull-left">
                        <img alt="" src="{{asset( config('constants.optAdmin.up') . '/posts/'.$module->slug . '/300_300_' .$post->postByLang->upload)}}" class="thumbnail media-object">
                    </a>
                    <div class="media-body">
                        <h4 class="person-name">{{str_limit($post->postByLang->name,20)}}</h4>
                        @if($module->have_parent_module)
                          <div class="text-muted"><i class="fa fa-bookmark"></i> {{$post->childParent->postByLang->name}}</div>
                        @endif
                        @if($module->have_status)
                            <div class="text-muted"><i class="fa fa-{{$post->status == 0 ? 'square' : 'square-o'}}"></i> @lang($post->status == 0 ? 'admin.published' : 'admin.not_published')</div>
                        @endif
                        <ul class="social-list">
                            <li><a href="{{ URL::to('admin/posts/'.$module->slug.'/' . $post->id . '/edit') }}" class="tooltips load_content_ajax" data-toggle="tooltip" data-placement="top" title="@lang('admin.edit')"><i class="fa fa-edit"></i></a></li>
                            @if($module->have_add_new == 1 || Auth::user()->level === 'root')
                                <li>
                                    {{ Form::open(array('route' => array('admin.posts.destroy', $post->id), 'method' => 'delete','class'=>'delete-ajax')) }}
                                    <button  class="btn-white tooltips" data-toggle="tooltip" data-placement="top" title="@lang('admin.delete')" type="submit"><i class="fa fa-trash-o"></i></button>
                                    {{ Form::close() }}
                                </li>
                            @endif
                            @if($module->have_ordered)
                                <li>
                                    <input type="text" name="order_id[]" value="{{$post->id}}" class="hidden">
                                    <a href="#" class="sort-button tooltips" data-toggle="tooltip" data-placement="top" title="@lang('admin.sort')"><i class="fa fa-sort"></i> </a>
                                </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div><!-- col-md-6 -->
        @endif
    @endforeach
    <div class="col-md-12 pagination-parent">
        {!! with(new App\Pagination\AcmePresenter($posts))->render() !!}
    </div>
    @endif
@elseif($module->view_style == 'style_3')
    @if(count($posts))
        @foreach($posts as $post)
        <tr class="sort-root">
          {{--<td>{{ $post->id }}</td>--}}
          <td>{{str_limit($post->postByLang->name,20)}}</td>
          @if($module->have_parent_module)
              <td>{{$post->childParent->postByLang->name}}</td>
          @endif
          @if($module->have_status)
              <td>@lang($post->status == 0 ? 'admin.published' : 'admin.not_published')</td>
          @endif
          <td class="table-action-hide">
              <a class="load_content_ajax" href="{{ URL::to('admin/posts/'.$module->slug.'/' . $post->id . '/edit') }}"><i class="fa fa-pencil"></i></a>
              @if($module->have_add_new == 1 || Auth::user()->role->slug === 'root')
                  {{ Form::open(array('route' => array('admin.posts.destroy', $post->id), 'method' => 'delete','class'=>'delete-ajax')) }}
                  <button class="delete-row" type="submit"><i class="fa fa-trash-o"></i></button>
                  {{ Form::close() }}
              @endif

              @if($module->have_ordered)
                  <input type="text" name="order_id[]" value="{{$post->id}}" class="hidden">
                  <a href="#" class="sort-button"><i class="fa fa-sort"></i> </a>
              @endif
          </td>
        </tr>
        @endforeach
        <tr class="col-md-12 pagination-parent">
            <td colspan="3">
                {!! with(new App\Pagination\AcmePresenter($posts))->render() !!}
            </td>
        </tr>
    @endif
@endif
