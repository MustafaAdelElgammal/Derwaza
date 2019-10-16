<?php $branchPrices = $branch ? $branch->branchDishPrice : null;?>
@foreach($dishes as $dish)
    <?php $prices = $branchPrices ? $branchPrices->where('dish_id', $dish->id)->first() : null;?>
    <div class="col-md-4 price-input-parent">
        {{Markup::textInputMaterial(
            $dish->name_en . ' *',
             'price_branch['.  $dish->id .']',
             $prices?$prices->price : null,
             $errors->first('price_branch_' . $dish->id),
             8,
             "validateWithoutZero(event)"
         )}}
    </div>
@endforeach
<div class="mb30 clearfix"></div>
