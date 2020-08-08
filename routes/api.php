<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
// To get Deals
Route::get('/deals','shopping\dealController@index')->middleware('APIAccess');
// To Get All Products
Route::get('/products','shopping\productController@index')->middleware('APIAccess');
// To Browse More Popular
Route::get('/popular','shopping\popularController@index')->middleware('APIAccess');
//  To Browse All Products Of Mall
Route::get('/goods/mall/load','shopping\shops\mallController@show')->middleware('APIAccess');
//  To Browse All Products Of Backery
Route::get('/goods/bakery/load','shopping\shops\bakeryController@show')->middleware('APIAccess');
//  To Browse All Products Of Shops
Route::get('/goods/shops/load','shopping\shops\shopsController@show')->middleware('APIAccess');

//  Authonticated
Route::group([

    'middleware' => 'api',
    'namespace' => 'Api\Auth',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});

Route::get('/test',function(){
    return "test Has Done";
})->middleware('auth:api');
