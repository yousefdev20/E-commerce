<?php

namespace App\Http\Controllers\shopping;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\cart\cart;
use Illuminate\Support\Facades\Cache;

class productController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
      Cache::remember('products', 300, function(){
        return $Products = collect(DB::table('products')
        ->join('weights', 'products.weight_id', '=', 'weights.id')
        ->select('products.*','weights.name as weight_name')
        ->get())->all();
      });
      return Cache::get('products');

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $req)
    {

      $collection = collect(DB::table('products')->where('id',$req->id)->get());
      for ($i = 0; $i < $req->quantity; $i++) {
        Session::push('cart',$collection);
      }
      return Session::get('cart');


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        /*
          * here we was`nt use object cart to stored data the data stored direct on Session
          * when remove an item get all stored object from session
          * put data in collection
          * search item
          * and remove
        */
        $arr = [];
        $flag = false;
        $collection = collect(Session::get('cart'));
        $obj = collect($collection->collapse()->sort());
        foreach ($obj as $value) {
          if($value->id == $id){
            if ($flag) {
              array_push($arr, $value);
            }
            $flag = true;
          }else {
            array_push($arr, $value);
          }
        }
        Session::forget('cart');
        Session::push('cart',collect($arr));
        return collect(Session::get('cart'));
    }
}
