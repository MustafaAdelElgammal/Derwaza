@foreach($dish_of_days as $day)
    <div class="col-md-4 mb15">
        <div class='form-group label-floating'>
            <label for="dish_of_{{$day->slug}}" class='control-label'>Choose dish of {{$day->name_en}} *</label>
            <select class="chosen-select form-control" name="dish_of_{{$day->slug}}" id="dish_of_{{$day->slug}}">
                <option value="null">Choose dish of {{$day->name_en}}</option>
                @foreach($dishes as $dish)
                    <option value="{{$dish->id}}" @if($day->dish_id == $dish->id) selected @endif>{{$dish->name_en}}</option>
                @endforeach
            </select>
            <span class='help-block'></span>
            @if($errors->first('dish_of_' . $day->slug))
                <span class='help-block'>{{$errors->first('dish_of_' . $day->slug)}}</span>
            @endif
        </div>
    </div>
@endforeach
<div class="mb30 clearfix"></div>