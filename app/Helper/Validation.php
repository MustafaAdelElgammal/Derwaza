<?php
namespace app\Helper;
use Illuminate\Validation\Validator;
use Illuminate\Support\Facades\Hash;
use Auth;
class Validation extends Validator {
    public function validateOldPassword($attribute, $value, $parameters){
        return Hash::check($value, Auth::user()->password);
    }
}