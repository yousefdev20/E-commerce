<?php

namespace App\Http\Controllers\shopping\shops;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class bakeryController extends Controller
{
    public function index(){
		Cache::remember('Bakerycategories', 300, function (){
			return $categories = collect($branches = DB::table('branches')
      ->select('branches.name as branche_name')
      ->where('store_id',2)->get()
      );
      $categories->values()->all();
    });
      $Bakerycategories = Cache::get('Bakerycategories');
      return view('shopping.bakery')->with('categories',$Bakerycategories);
    }
    public function show(){
      //i have three table to get data form them
      //so i will get the first table *
      /*
      * 1. stores
      * 2. branches
      * 3. products
      */
	  Cache::remember('BakeryProducts', 300, function(){
		  return  $branches = DB::table('products')
		  ->leftJoin('branches', 'products.branch_id', '=', 'branches.id')
		  ->where('store_id',2)
		  ->select('products.name as name',
		  'branches.name as branche_name',
		  'products.price',
		  'products.image_url',
		  'products.image_url',
		  'products.id',
		  )
		  ->get();
	      
	  });
      return Cache::get('BakeryProducts');
   

    }
}
