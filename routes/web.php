<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
| Middleware options can be located in `app/Http/Kernel.php`
|
*/

// Homepage Route
Route::group(['middleware' => ['web', 'checkblocked']], function () {
    Route::get('/', 'WelcomeController@welcome')->name('welcome');
    Route::get('/our-project', 'WelcomeController@our_project_index');
    Route::get('/our-project/{id}', 'WelcomeController@our_project_show');

    Route::get('/about-us', 'WelcomeController@about_us_index');
    Route::get('/contact-us', 'WelcomeController@contact_us_index');
    Route::post('/refresh-stock', 'WelcomeController@refresh_stock');
});


// Authentication Routes
Auth::routes();

// Public Routes
Route::group(['middleware' => ['web', 'activity', 'checkblocked']], function () {

    // Activation Routes
    Route::get('/activate', ['as' => 'activate', 'uses' => 'Auth\ActivateController@initial']);

    Route::get('/activate/{token}', ['as' => 'authenticated.activate', 'uses' => 'Auth\ActivateController@activate']);
    Route::get('/activation', ['as' => 'authenticated.activation-resend', 'uses' => 'Auth\ActivateController@resend']);
    Route::get('/exceeded', ['as' => 'exceeded', 'uses' => 'Auth\ActivateController@exceeded']);

    // Socialite Register Routes
    Route::get('/social/redirect/{provider}', ['as' => 'social.redirect', 'uses' => 'Auth\SocialController@getSocialRedirect']);
    Route::get('/social/handle/{provider}', ['as' => 'social.handle', 'uses' => 'Auth\SocialController@getSocialHandle']);

    // Route to for user to reactivate their user deleted account.
    Route::get('/re-activate/{token}', ['as' => 'user.reactivate', 'uses' => 'RestoreUserController@userReActivate']);
});

// Registered and Activated User Routes
Route::group(['middleware' => ['auth', 'activated', 'activity', 'checkblocked']], function () {

    // Activation Routes
    Route::get('/activation-required', ['uses' => 'Auth\ActivateController@activationRequired'])->name('activation-required');
    Route::get('/logout', ['uses' => 'Auth\LoginController@logout'])->name('logout');
});

// Registered and Activated User Routes
Route::group(['middleware' => ['auth', 'activated', 'activity', 'twostep', 'checkblocked']], function () {

    //  Homepage Route - Redirect based on user role is in controller.
    Route::get('/home', ['as' => 'public.home',   'uses' => 'UserController@index']);

    // Show users profile - viewable by other users.
    Route::get('profile/{username}', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@show',
    ]);
});

// Registered, activated, and is current user routes.
Route::group(['middleware' => ['auth', 'activated', 'currentUser', 'activity', 'twostep', 'checkblocked']], function () {

    // User Profile and Account Routes
    Route::resource(
        'profile',
        'ProfilesController', [
            'only' => [
                'show',
                'edit',
                'update',
                'create',
            ],
        ]
    );
    Route::put('profile/{username}/updateUserAccount', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@updateUserAccount',
    ]);
    Route::put('profile/{username}/updateUserPassword', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@updateUserPassword',
    ]);
    Route::delete('profile/{username}/deleteUserAccount', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@deleteUserAccount',
    ]);

    // Route to show user avatar
    Route::get('images/profile/{id}/avatar/{image}', [
        'uses' => 'ProfilesController@userProfileAvatar',
    ]);

    // Route to upload user avatar.
    Route::post('avatar/upload', ['as' => 'avatar.upload', 'uses' => 'ProfilesController@upload']);

    Route::post('booking/{id_properti}', 'UserController@booking_add');
    Route::post('xbooking/store/{id_properti}', 'UserController@booking_store');
    Route::get('mybooking', 'UserController@booking_index');
    Route::get('konfirmasi/form/{id_booking}', 'UserController@konfirmasi_form');
    Route::post('konfirmasi/form/{id_booking}', 'UserController@konfirmasi_store');

});

// Registered, activated, and is admin routes.
Route::group(['middleware' => ['auth', 'activated', 'role:admin', 'activity', 'twostep', 'checkblocked']], function () {
    Route::resource('/users/deleted', 'SoftDeletesController', [
        'only' => [
            'index', 'show', 'update', 'destroy',
        ],
    ]);

    Route::resource('users', 'UsersManagementController', [
        'names' => [
            'index'   => 'users',
            'destroy' => 'user.destroy',
        ],
        'except' => [
            'deleted',
        ],
    ]);
    Route::post('search-users', 'UsersManagementController@search')->name('search-users');

    Route::resource('themes', 'ThemesManagementController', [
        'names' => [
            'index'   => 'themes',
            'destroy' => 'themes.destroy',
        ],
    ]);

    Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index');
    Route::get('routes', 'AdminDetailsController@listRoutes');
    Route::get('active-users', 'AdminDetailsController@activeUsers');

    Route::get('properti', 'AdminController@properti_index');
    Route::get('properti/add', 'AdminController@properti_add');
    Route::post('properti/add', 'AdminController@properti_store');
    Route::get('properti/edit/{id}', 'AdminController@properti_edit');
    Route::post('properti/edit/{id}', 'AdminController@properti_update');
    Route::delete('properti/delete/{id}', 'AdminController@properti_destroy');

    Route::get('booking', 'AdminController@booking_index');
    Route::get('booking/edit/{id}', 'AdminController@booking_edit');
    Route::post('booking/edit/{id}', 'AdminController@booking_update');
    
    Route::get('konfirmasi', 'AdminController@konfrimasi_index');
    Route::post('konfirmasi/approve/{id}', 'AdminController@konfirmasi_update');

    Route::get('project', 'AdminController@project_index');
    Route::get('project/add', 'AdminController@project_add');
    Route::post('project/add', 'AdminController@project_store');
    Route::get('project/edit/{id}', 'AdminController@project_edit');
    Route::post('project/edit/{id}', 'AdminController@project_update');

    Route::get('marketing', 'AdminController@marketing_index');
    Route::get('marketing/add', 'AdminController@marketing_add');
    Route::post('marketing/add', 'AdminController@marketing_store');
    Route::get('marketing/edit/{id}', 'AdminController@marketing_edit');
    Route::post('marketing/edit/{id}', 'AdminController@marketing_update');

});

Route::redirect('/php', '/phpinfo', 301);
