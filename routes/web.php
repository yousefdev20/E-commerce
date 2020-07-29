<?php

use Illuminate\Support\Facades\Route;
//use Barryvdh\DomPDF\Facade\Pdf;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/',function(){
  return redirect()->route('index');
});
Route::get('/main/{lang}','shopping\shopController@index')->name('index');
Route::get('/','shopping\shopController@ConfigrationLanguageIndex');
//languages
Route::group(['prefix'=> 'lang', 'namespace' => 'lang'],function(){
    Route::get('/ar','langController@ar')->name('ar');
    Route::get('/en','langController@en')->name('en');
});

//for optimize performance
Route::get('admin/cache','cache\cacheController@index');
Route::get('admin/down','cache\cacheController@down');
Route::get('admin/up','cache\cacheController@up');


Route::get('/pdf','bill\PDFController@installBill');