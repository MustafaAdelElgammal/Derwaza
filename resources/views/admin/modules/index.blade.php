@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-shield"></i> Modules</h2></div>
<div class="contentpanel">
    <div class="col-md-6">
        <div class="table-responsive">
            <table class="table table-hidaction table-hover mb30">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>OD</th>
                        <th>Module Name</th>
                        <th>Module Slug</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="multi">
                @foreach($modules as $module)
                    <tr class="sort-root">
                        <td>{{ $module->id }}</td>
                        <td>{{ $module->order_menu }}</td>
                        <td>{{ $module->name_en }}</td>
                        <td>{{ $module->slug }}</td>
                        <td class="table-action-hide">
                            <a class="load_content_ajax" href="{{ URL::to('admin/modules/' . $module->id . '/edit') }}"><i class="fa fa-pencil"></i></a>
                            {{ Form::open(array('route' => array('admin.modules.destroy', $module->id), 'method' => 'delete','class'=>'','onclick'=>"if(confirm('Sure You want to delete..')== 0){return false;}")) }}
                            <button class="delete-row" type="submit"><i class="fa fa-trash-o"></i></button>
                            {{ Form::close() }}
                            <a class="sort-button" href="#"><i class="fa fa-sort"></i></a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
