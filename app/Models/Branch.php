<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    public $timestamps = false;

    public static $rules_create = [
        'name_ar'    => 'required|max:75',
        'name_en'    => 'required|max:75',
        'address_ar' => 'required|max:150',
        'address_en' => 'required|max:150',
        'latitude'   => 'required|numeric|digits_between:1,40',
        'longitude'  => 'required|numeric|digits_between:1,40',
        'phone'      => 'required',
        'is_active'  => 'required'
    ];

    public static $rules_edit = [
        'name_ar'    => 'required|max:75',
        'name_en'    => 'required|max:75',
        'address_ar' => 'required|max:150',
        'address_en' => 'required|max:150',
        'latitude'   => 'required|numeric|digits_between:1,40',
        'longitude'  => 'required|numeric|digits_between:1,40',
        'phone'      => 'required',
        'is_active'  => 'required'
    ];
    

}
