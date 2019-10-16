@extends("admin.$layout")
@section('content')
    <div class="pageheader"><h2><i class="fa fa-users"></i> Branches</h2></div>
    <div class="contentpanel">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                        <h4 class="panel-title">Edit Branch {{$branch->name_en}}</h4>
                    </div>
                    <div class="panel-body">
                        <div class="basic-wizard wizard form-wizard" id="progressWizard">
                            {{ Form::model($branch, array('route' => array('admin.branches.update', $branch->id), 'method'=> 'put', 'class' => 'submit-ajax general-form', 'id' => 'branch-management')) }}
                            @include('admin.branches.form')
                            <button class='btn btn-block btn-default submit-finish'><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                            {{ Form::close() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection