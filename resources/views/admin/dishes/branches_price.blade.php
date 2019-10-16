<?php $dishPrices = $dish ? $dish->dishBranchPrice : null;?>
@foreach($branches as $branch)
    <?php $prices = $dishPrices ? $dishPrices->where('branch_id', $branch->id)->first() : null;?>
    <div class="col-md-4 price-input-parent">
        {{Markup::textInputMaterial(
            'Price for '.$branch->name_en . ' *',
             'price_branch_' . $branch->id,
             $prices?$prices->price : null,
             $errors->first('price_branch_' . $branch->id),
             8,
             "validateWithoutZero(event)"
         )}}
    </div>
@endforeach
<div class="mb30 clearfix"></div>
