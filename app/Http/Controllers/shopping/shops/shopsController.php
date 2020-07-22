<?php

namespace App\Http\Controllers\shopping\shops;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
class shopsController extends Controller
{
  public function index(){

    Cache::remember('shopsCategories' ,300 , function() {
      return $categories = collect($branches = DB::table('branches')
      ->select('branches.name as branche_name')
      ->where('store_id',3)->get()
      );
      $categories->values()->all();
    });
    $categories = Cache::get('shopsCategories');
    return view('shopping.shop')->with('categories',$categories);
  }
  public function show(){
    // for load methods
    //i have three table to get data form them
    //so i will get the first table *
    /*
    * 1. stores
    * 2. branches
    * 3. products
    */
    Cache::remember('ShopProducts', 300, function(){
      return  DB::table('products')
      ->leftJoin('branches', 'products.branch_id', '=', 'branches.id')
      ->where('store_id',3)
      ->select('products.name as name',
      'branches.name as branche_name',
      'products.price',
      'products.image_url',
      'products.image_url',
      'products.id',
      )
      ->get();

    });
    return Cache::get('ShopProducts');
  }
}
