@extends("admin.$layout")
@section('content')
    <div class="pageheader"><h2><i class="fa fa-users"></i> @lang('admin.categories')</h2></div>
    <div class="contentpanel">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-btns"><a href="#" class="minimize maximize">+</a></div>
                        <h4 class="panel-title">@lang('admin.add_record_to_categories')</h4>
                    </div>
                    <div class="panel-body" style="display:none">
                        <div class="basic-wizard wizard form-wizard" id="progressWizard">
                            {{ Form::model($currentCategory = null, array('route' => 'admin.categories.store','method'=> 'post','files' => true, 'class' => 'submit-ajax', 'id' => 'categories-management')) }}
                            @include('admin.categories.form')
                            <button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                            {{ Form::close() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="people-list">
            <hr>
            <div class="row load-more-ajax-wrapper" id="multi">
                @include('admin.categories.data')
            </div>
        </div>
    </div>
@endsection
