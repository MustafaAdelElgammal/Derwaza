@if(count($clients) > 0)
<section class="client_logo_area">
    <div class="main_title">
        <h2 class="lineMargin">
            <img class="left_img" src="{{$img}}/title-left-bar.png" alt="News Slider">
            @lang('web.Our_clients')
            <img class="right_img" src="{{$img}}/title-right-bar.png" alt="News Slider">
        </h2>
    </div>
    <div class="container">


        @foreach($clients as $client)
            @php($client = $client->postByLang)
            <div class="client_logo col-md-2 col-xs-6 col-sm-6">
                <img src="{{$up.'/posts/clients/'.$client->upload }}" alt="{{$client->name}}">
            </div>
        @endforeach
    </div>
</section>
@endif