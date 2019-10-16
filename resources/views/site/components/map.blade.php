<iframe class="mapBox row m0"
        width="300"
        height="250px"
        frameborder="0"
        src="https://maps.google.com/maps?q={{$headBranch->latitude}},{{$headBranch->longitude}}&hl=es;z=14&amp;output=embed"
>
</iframe>


{{--<div id="map" style="height: 400px;">--}}
{{--</div>--}}
{{--@foreach($branches as $branch)--}}
{{--@section('js')--}}
        {{--<script type="text/javascript">--}}
    {{--var locations = [--}}
        {{--['Darwaza Head office', {{$headBranch->latitude}}, {{$headBranch->longitude}},1],--}}
        {{--['Darwaza Branch office', {{$branch->latitude}}, {{$branch->longitude}},2]--}}
    {{--];--}}

    {{--var map = new google.maps.Map(document.getElementById('map'), {--}}
        {{--zoom: 12,--}}
        {{--center: new google.maps.LatLng(29.29148500, 47.91954400),--}}
        {{--mapTypeId: google.maps.MapTypeId.ROADMAP--}}
    {{--});--}}

    {{--var infowindow = new google.maps.InfoWindow();--}}

    {{--var marker, i;--}}

    {{--for (i = 0; i < locations.length; i++) {--}}
        {{--marker = new google.maps.Marker({--}}
            {{--position: new google.maps.LatLng(locations[i][1], locations[i][2]),--}}
            {{--map: map--}}
        {{--});--}}

        {{--google.maps.event.addListener(marker, 'click', (function(marker, i) {--}}
            {{--return function() {--}}
                {{--infowindow.setContent(locations[i][0]);--}}
                {{--infowindow.open(map, marker);--}}
            {{--}--}}
        {{--})(marker, i));--}}
    {{--}--}}
{{--</script>--}}
{{--@endsection--}}
{{--@endforeach--}}
