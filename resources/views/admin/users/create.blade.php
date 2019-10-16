@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-users"></i> @lang('admin.users')</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                    <h4 class="panel-title"> @lang('admin.create_new_user')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('route' => 'admin.users.store', 'method'=> 'post', 'files' => true, 'class' => 'submit-ajax', 'id' => 'users-management')) }}
                        @include('admin.users.form')
                        <div class="col-md-12">
                            <div class='form-group label-floating'>
                                <button class='btn btn-success-alt btn-block submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                            </div>
                        </div>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
