<?php

namespace App\Http\Controllers\shopping;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class dealController extends Controller
{
    public function index(){
		Cache::remember('deals' ,300, function () {
      $deals = DB::table('deals')
      ->leftJoin('products','deals.product_id','=','products.id')
      ->select(DB::raw('
      products.id as id,
      products.name,products.image_url,
      products.price,products.weight_id
      '));

      $weights = DB::table('weights')
        ->joinSub($deals, 'deals', function ($join) {
        $join->on('weights.id', '=', 'deals.weight_id');
        })
        ->select('weights.name as weight_name', 'deals.price', 'deals.image_url', 'deals.name as name', 'deals.id as id')
        ->get();
        return $weights;
    });
    return Cache::get('deals');
    }
}
