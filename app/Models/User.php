<?php
namespace App\Models;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * @property int role_id
 * @property int is_active
 * @property string first_name
 * @property string last_name
 * @property string email
 * @property boolean gender
 * @property string password
 * @property string avatar
 * @property string address
 * @property string phone
 * @property integer city_id
 * @property UserAddress addresses
 * @property Order orders
 */
class User extends Authenticatable{

    protected $fillable = [ 'name', 'email', 'password' ] ;
    protected $hidden   = [ 'password', 'remember_token' ] ;

    public function role(){return $this->belongsTo('App\Models\Role');}
    public static $rules = array(
        'email'           => 'required|email|unique:users',
        'password'        => 'required|min:8|same:confirmPassword',
        'confirmPassword' => 'required|same:password' ,
        'avatar'          => 'mimes:jpeg,jpg,png|max:200',
        'role_id'         => 'required|not_in:null|exists:roles,id',
        'gender'          => 'required|not_in:null',
        'is_active'       => 'required|not_in:null',
        'first_name'      => 'required|max:25',
        'last_name'       => 'required|max:25'
    );
    public static $rules_edit = array(
//        'role_id'    => 'required|not_in:null|exists:roles,id',
//        'gender'     => 'required|not_in:null',
//        'avatar'     => 'mimes:jpeg,jpg,png|max:200',
        'is_active'  => 'required|not_in:null',
//        'first_name' => 'required|max:25',
//        'last_name'  => 'required|max:25'
    );
    public static $rules_edit_with_email = array(
//        'email'      => 'required|email|unique:users',
//        'avatar'     => 'mimes:jpeg,jpg,png|max:200',
//        'role_id'    => 'required|not_in:null|exists:roles,id',
//        'gender'     => 'required|not_in:null',
        'is_active'  => 'required|not_in:null',
//        'first_name' => 'required|max:25',
//        'last_name'  => 'required|max:25'
    );
    public static $rules_edit_with_password = array(
//        'role_id'         => 'required|not_in:null|exists:roles,id',
//        'gender'          => 'required|not_in:null',
//        'avatar'          => 'mimes:jpeg,jpg,png|max:200',
        'is_active'       => 'required|not_in:null',
//        'first_name'      => 'required|max:25',
//        'last_name'       => 'required|max:25',
        'password'        => 'required|min:8|same:confirmPassword',
        'confirmPassword' => 'required|same:password'
    );
    public static $rules_edit_with_password_email = array(
//        'email'           => 'required|email|unique:users',
//        'avatar'          => 'mimes:jpeg,jpg,png|max:200',
//        'role_id'         => 'required|not_in:null|exists:roles,id',
//        'gender'          => 'required|not_in:null',
        'is_active'       => 'required|not_in:null',
//        'first_name'      => 'required|max:25',
//        'last_name'       => 'required|max:25',
        'password'        => 'required|min:8|same:confirmPassword',
        'confirmPassword' => 'required|same:password'
    );
    public static $rules_user_edit = array(
        'gender'     => 'required|not_in:null',
        'first_name' => 'required|max:25',
        'last_name'  => 'required|max:25',
    );
    public static $rules_user = array(
        'email'            => 'required|email|unique:users',
        'password'         => 'required|min:8|same:confirmPassword',
        'confirmPassword'  => 'required|same:password'
    );
    public static $rules_password = array(
        'currentPassword' => 'required|old_password',
        'password'        => 'required|min:8|same:confirmPassword',
        'confirmPassword' => 'required|same:password'
    );
    public static $rules_change_email= array(
        'currentPasswordEmail' => 'required|old_password',
        'email'                => 'required|email|unique:users',
    );
    public static $visitor_rules = array(
        'email'             => 'required|email|unique:users',
        'password'          => 'required|min:8|same:confirmPassword|min:6',
        'confirmPassword'   => 'required|same:password' ,
        'gender'            => 'required|not_in:null',
        'first_name'        => 'required|max:25',
        'last_name'         => 'required|max:25'
    );
}
