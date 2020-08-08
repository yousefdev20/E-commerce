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

/*
* to browse main page
*
*/
Route::resource('/shopping', 'shopping\shopController');
/*
* index To Browse All Products in Cache
* store To Create Cart and Stored Data
* destroy To destroy To Delete Item In Cart Or destroy The Cart
*/
Route::resource('/product', 'shopping\productController');
/*
* index To Browse Cart Shopping
*
*/
Route::resource('/cart', 'cart\cartController');

//to load cart
Route::get('/shopping/cart/load',function(){
  return view('cart.cart');
})->name('cart');
// resourses post, get, put, delete methothods
/*
* store to store orders
* CheckOut to applied payment methods
* index to prowse all orders but we dont need here it made in voyager admin panel not here
* constructer the user shell be authonticated to use any things from this group
*/
Route::resource('/order', 'order\orderController');
// To Browse Delas
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

// To Payment Methods Disabile now still not working
Route::group(['prefix' => '/payment', 'namespace' => 'payment'],function(){
  Route::post('/pay','paymentProviderController@request')->name('payment');
  Route::get('/pay','paymentProviderController@request')->name('responsePayment');
  Route::get('/readSession','paymentProviderController@readSession');
});

//popular
Route::get('/popular','shopping\popularController@index');

//  To Applied Coupon Code
Route::post('/cart/coupon/applied','order\orderController@CheckOut');
