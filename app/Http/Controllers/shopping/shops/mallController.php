<?php

namespace App\Http\Controllers\shopping\shops;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class mallController extends Controller
{
  public function index(){
	  Cache::remember('MallCategories' ,300 ,function (){
			return $categories = collect($branches = DB::table('branches')
      ->select('branches.name as branche_name')
      ->where('store_id',1)->get()
      );
      $categories->values()->all();
	});
    $MallCategories = Cache::get('MallCategories');
    return view('shopping.mall')->with('categories',$MallCategories);
  }
  public function show(){
    //i have three table to get data form them
    //so i will get the first table *
    /*
    * 1. stores
    * 2. branches
    * 3. products
    */
	
	
	Cache::remember('MallProducts' ,300 ,function (){
		 return $branches = DB::table('products')
    ->leftJoin('branches', 'products.branch_id', '=', 'branches.id')
    ->where('store_id',1)
    ->select('products.name as name',
    'branches.name as branche_name',
    'products.price',
    'products.image_url',
    'products.image_url',
    'products.id',
    )
    ->get();
	});
   
    return Cache::get('MallProducts');
  }
}
