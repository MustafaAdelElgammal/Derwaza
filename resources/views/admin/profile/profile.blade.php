@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-user"></i> My profile</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-sm-3">
            <img src="{{asset(config('constants.optAdmin.up') . '/avatar'.'/100_100_'. Auth::User()->avatar) }}" class="thumbnail img-responsive" alt="">
            <div class="mb30">{{Auth::User()->first_name . " " . Auth::User()->last_name}}</div>
        </div>
    </div><!-- row -->
</div>
@endsection
