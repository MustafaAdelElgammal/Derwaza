<?php
Route::group(['middleware' => ['Localization']], function() {
    Route::group(['prefix' =>  LaravelLocalization::setLocale()], function() {
        //Single Pages Start
        Route::get('/', 'Web\HomeController@index');
        Route::get('/sectors', 'Web\HomeController@sectorsDetails');
        Route::get('/sectors/{slug}', 'Web\HomeController@oneSectorDetails');
//        Route::get('/news', 'Web\HomeController@news');
//        Route::get('/news/{slug}', 'Web\HomeController@newsDetails');
        Route::get('/about', 'Web\HomeController@about');
        Route::get('/terms_conditions', 'Web\HomeController@terms');
        Route::get('/privacy_policy', 'Web\HomeController@privacyPolicy');
        Route::get('/contact', 'Web\HomeController@contact');
        Route::post('/contact', 'Web\HomeController@contactPost');
        Route::get('/errors', 'Web\HomeController@errors');
        Route::get('pagenotfound', ['as' => 'notfound', 'uses' => 'Web\HomeController@pagenotfound']);
        //Menu Shopping Pages

    });
    Route::get('changeLanguage/{lang}', 'Web\HomeController@changeLanguage');
});
Route::group(['prefix' => 'admin'], function() {
    Route::group(array('middleware' => 'AuthAdmin') ,function(){

        Route::resource('categories'       ,'Admin\AdminCategoriesController');
        Route::post('branches/make_default/{branch_id}', ['as' => 'admin.branches.make_default', 'uses' => 'Admin\AdminBranchesController@makeDefault']);
        Route::resource('branches','Admin\AdminBranchesController');
        Route::get('/'          , 'Admin\AdminController@index');
        Route::get('logout'     , 'Admin\AdminController@logout');

//        Route::post('users/change_status/{user_id}', ['as' => 'admin.users.change_status', 'uses' => 'Admin\AdminUserController@changeStatus']);
//        Route::resource('users' , 'Admin\AdminUserController');

        /*(CONFIGURATION START)*/
        Route::get(  'configuration'                    , 'Admin\AdminConfigurationController@index');
        Route::post( 'configuration/main'               , 'Admin\AdminConfigurationController@updateMain');
        Route::post( 'configuration/main/admin_language', 'Admin\AdminConfigurationController@updateAdminLanguage');
        Route::post( 'configuration/main/site_language' , 'Admin\AdminConfigurationController@updateSiteLanguage');
        Route::post( 'configuration/main/site_status'   , 'Admin\AdminConfigurationController@updateSiteStatus');
        Route::post( 'configuration/main/site_social'   , 'Admin\AdminConfigurationController@updateSocial');
        Route::post( 'configuration/main/site_seo'   , 'Admin\AdminConfigurationController@updateSiteSeo');
        Route::post( 'configuration/main/site_google_analysis'   , 'Admin\AdminConfigurationController@updateSiteGoogleAnalysisScript');
        /*(CONFIGURATION END)*/

        /*(PROFILE START)*/
        Route::get( 'profile'             , 'Admin\AdminProfileController@showMyProfile');
        Route::get( 'profile/settings'    , 'Admin\AdminProfileController@editMyProfile');
        Route::post('profile/save_profile', 'Admin\AdminProfileController@saveMyProfile');
        Route::post('profile/set_password', 'Admin\AdminProfileController@setMyPassword');
        Route::post('profile/change_email', 'Admin\AdminProfileController@changeMyEmail');
        /*(PROFILE END)*/

        /*(POSTS START)*/
        Route::resource('posts'                   , 'Admin\AdminPostsController');
        Route::get( 'posts/{module}/{id}/edit'    , 'Admin\AdminPostsController@edit');
        Route::get( 'posts/{moduleSlug}/create'   , 'Admin\AdminPostsController@createNew');
        Route::post('posts/categoryChange/{id}'   , 'Admin\AdminPostsController@categoryChange');
        Route::post('posts/statusChange/{id}'     , 'Admin\AdminPostsController@statusChange');
        Route::post('post/ordered_change'         , 'Admin\AdminPostsController@orderedChange');
        Route::get( 'post/gallery/{postId}'       , 'Admin\AdminPostsController@postGallery');
        Route::get( 'post/gallery/{postId}/get'   , 'Admin\AdminPostsController@getPostGallery');
        Route::get( 'post/gallery/{postId}/delete/{fileName}' , 'Admin\AdminPostsController@delPostGallery');
        Route::post('post/gallery/{postId}/add'   , 'Admin\AdminPostsController@addPostGallery');
        Route::post('post/upload_file','Admin\AdminPostsController@uploadSummer');

        Route::post('orders/approved_order/{id}', ['as' => 'admin.orders.approved_order', 'uses' => 'Admin\AdminOrdersController@approvedOrder']);
        Route::post('orders/cancel_order/{id}', ['as' => 'admin.orders.cancel_order', 'uses' => 'Admin\AdminOrdersController@cancelOrder']);
        Route::post('orders/queued_order/{id}', ['as' => 'admin.orders.queued_order', 'uses' => 'Admin\AdminOrdersController@queuedOrder']);
        Route::post('orders/in_preparation/{id}', ['as' => 'admin.orders.in_preparation', 'uses' => 'Admin\AdminOrdersController@inPreparation']);
        Route::post('orders/out_for_delivery/{id}', ['as' => 'admin.orders.out_for_delivery', 'uses' => 'Admin\AdminOrdersController@outForDelivery']);
        Route::post('orders/delivered/{id}', ['as' => 'admin.orders.delivered', 'uses' => 'Admin\AdminOrdersController@delivered']);
        Route::get('orders/get_by', ['as' => 'admin.orders.get_by', 'uses' => 'Admin\AdminOrdersController@index']);
        Route::get('orders/', ['as' => 'admin.orders.index', 'uses' => 'Admin\AdminOrdersController@index']);
        Route::get('orders/get_details/{id}', ['as' => 'admin.orders.get_details', 'uses' => 'Admin\AdminOrdersController@getOrderDetails']);
        Route::group(array('middleware' => 'AuthRoot'), function(){Route::resource('permissions', 'Admin\AdminUserController@permissions');Route::resource('modules', 'Admin\AdminModuleController');});
    });
    Route::group(['middleware' => ['guest']], function(){Route::get( '/login', 'Admin\AdminController@login');Route::post('/login', 'Admin\AdminController@doLogin');});
});
