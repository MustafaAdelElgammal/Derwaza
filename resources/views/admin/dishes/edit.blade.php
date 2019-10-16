@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-users"></i> @lang('admin.dish_edit')</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                    <h4 class="panel-title">@lang('admin.dish_edit')</h4>
                </div>
                <div class="panel-body">
                    <div class="basic-wizard wizard form-wizard" id="progressWizard">
                    {{ Form::model($dish, array('route' => array('admin.dishes.update',$dish->id),'method'=> 'put','files' => true, 'id' => 'submit-ajax-new-dish')) }}
                        @include('admin.dishes.form')
                        <button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                    {{ Form::close() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
