@extends("admin.$layout")
@section('content')
    <div class="pageheader"><h2><i class="fa fa-users"></i> @lang('admin.dishes')</h2></div>
    <div class="contentpanel">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-btns"><a href="#" class="minimize maximize">+</a></div>
                        <h4 class="panel-title">@lang('admin.get_by_category')</h4>
                    </div>
                    <div class="panel-body" style="display: none">
                        <div class="row">
                            <div class="col-md-12">
                                {{ Form::model(null, array('route' => 'admin.dishes.get_by_category','method'=>'get', 'class' => 'search-ajax-submit')) }}
                                    <div class="item-wrap">
                                        <div class='form-group label-floating'>
                                            <label for='category_id' class='control-label'>@lang('admin.Select_dish_category_title')</label>
                                            <select class="chosen-select form-control" name="category_id" id="category_id_sort">
                                                <option value="null">@lang('admin.chose_category')</option>
                                                <option value="0">@lang('admin.all_category')</option>
                                                @foreach($categories as $cat)
                                                    <option value="{{$cat->id}}" class="type-{{$cat->is_side}}">{{$cat->$name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-12"><button style="margin-top:30px;" class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.search')</button></div>
                                    </div>
                                {{ Form::close() }}
                            </div>
                        </div>
                    </div>
                </div><!-- panel -->
            </div>
        </div>
        <div class="col-md-12"><hr></div>
        <div class="people-list">
            <div class="row load-more-ajax-wrapper" id="multi">
                @include('admin.dishes.data')
            </div>
        </div>
    </div>
@endsection
