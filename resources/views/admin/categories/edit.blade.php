@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-users"></i> @lang('admin.edit_categories')</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                    <h4 class="panel-title">@lang('admin.edit_categories')</h4>
                </div>
                <div class="panel-body">
                    <div class="basic-wizard wizard form-wizard" id="progressWizard">
                    {{ Form::model($currentCategory, array('route' => array('admin.categories.update',$currentCategory->id),'method'=> 'put','files' => true, 'class' => 'submit-ajax', 'id' => 'categories-management')) }}
                        @include('admin.categories.form')
                        <button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                    {{ Form::close() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
