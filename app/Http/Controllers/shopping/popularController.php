<?php

namespace App\Http\Controllers\shopping;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;


class popularController extends Controller
{
    public function index(Request $req){
      Cache::remember('popular' ,300, function () {
            $populars = DB::table('order_details')
                ->select(DB::raw('count(order_details.product_id) as count_Of_Recorde'))
                ->leftJoin('products', 'order_details.product_id', '=', 'products.id')
                ->leftJoin('weights', 'products.weight_id', '=', 'weights.name')
                ->select(DB::raw('
                  count(products.id) as count_Of_Recorde,
                  products.id,
                  products.name,products.image_url,
                  products.price,products.weight_id,
                  weights.name as weight_name
                  '))
                ->groupBy('product_id', 'id','name','image_url','price','weight_id','weight_name')
                ->havingRaw('count(product_id) > ?', [1])
                ->orderByDesc('count_Of_Recorde');
              $popular_table = DB::table('weights')
                ->joinSub($populars, 'populars', function ($join) {
                $join->on('weights.id', '=', 'populars.weight_id');
                })
              ->select('weights.name as weight_name', 'populars.price','populars.image_url','populars.name as product_name','populars.id','populars.count_Of_Recorde')
              ->orderByDesc('count_Of_Recorde')
              ->paginate(8);
          return $popular_table;
        });
        return Cache::get('popular');

    }
}
