@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-users"></i> @lang('admin.create_new_dish')</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                    <h4 class="panel-title">@lang('admin.add_record_to_dishes')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::model($dish, array('route' => 'admin.dishes.store','method'=> 'post','files' => true, 'id' => 'submit-ajax-new-dish')) }}
                        @include('admin.dishes.form')
                        <button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
