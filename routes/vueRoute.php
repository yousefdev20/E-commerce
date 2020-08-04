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
Route::resource('/shopping', 'shopping\shopController');
Route::resource('/product', 'shopping\productController');
Route::resource('/cart', 'cart\cartController');

//to load cart
Route::get('/shopping/cart/load',function(){
  return view('cart.cart');
})->name('cart');

Route::resource('/order', 'order\orderController');

Route::get('/deals','shopping\dealController@index');

Route::group(['prefix' => '/goods', 'namespace' => 'shopping\shops'],function(){
//For UI
  Route::get('/bakery','bakeryController@index');
  Route::get('/mall','mallController@index');
  Route::get('/shops','shopsController@index');
//With Id For Search Bar
  Route::get('/bakery/search/{id}','bakeryController@search');
  Route::get('/mall/search/{id}','mallController@search');
  Route::get('/shops/search/{id}','shopsController@search');
  //For API
  Route::get('/bakery/load','bakeryController@show');
  Route::get('/mall/load','mallController@show');
  Route::get('/shops/load','shopsController@show');
});
Route::get('shopping/bakery','shopping\shops\bakeryController@index');

Route::group(['prefix' => '/payment', 'namespace' => 'payment'],function(){
  Route::post('/pay','paymentProviderController@request')->name('payment');
  Route::get('/pay','paymentProviderController@request')->name('responsePayment');
  Route::get('/readSession','paymentProviderController@readSession');
});

//popular
Route::get('/popular','shopping\popularController@index');


//Route For Test
Route::get('/test', function(){
  return Cache::get('products');
});
Route::post('/cart/coupon/applied','order\orderController@CheckOut');
