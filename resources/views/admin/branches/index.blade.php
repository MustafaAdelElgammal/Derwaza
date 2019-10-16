@extends("admin.$layout")
@section('content')
    <div class="pageheader"><h2><i class="fa fa-users"></i> Branches</h2></div>
    <div class="contentpanel">
        <div class="people-list">
            <div class="row load-more-ajax-wrapper" id="multi">
                @include('admin.branches.data')
            </div>
        </div>
    </div>
@endsection
