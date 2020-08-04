<?php

namespace App\Http\Controllers\order;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class orderController extends Controller
{
  public function __construct(){
    $this->middleware('auth');
  }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     public $arra = [];
   public function array_push_assoc($array, $key, $value){
     $array[$key] = $value;
     return $array;
   }
    public function index()
    {
      return DB::table('orders')->where('unique_id', '=','3202007102346')->select('id')->first()->id;

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }
    public function CheckOut(Request $request) {
      $coupon = $request->coupon;
      if((DB::table('coupons')->where('code',$coupon)->exists())) {
        Session::put('coupon',$coupon);
      }else {
        return "filer!";
      }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {
      $ip = $request->server('REMOTE_ADDR');
      $user_agent = $request->header('User-Agent');
      date_default_timezone_set('Asia/Amman');
      $date = date('YmdHi');
      $user_id = auth()->user()->id;
      if (Session::has('cart')) {
        $date = date('YmdHi');
        $user_id = auth()->user()->id;
          $dateNow = date('Y-m-d');
          /*
           * status 1 Done.
           * status 2 Underway.
           * status 3 Block admin there proble here
           * check usesr.
           * */
        DB::table('orders')->insert([
          'user_email' => auth()->user()->id,
          'unique_id' => $user_id.$date,
            'created_at' => $dateNow,
            'status' => 2,
        ]);
        $data = [];
        $cart = collect(Session::get('cart'))->collapse();
        $dateNow = date('Y-m-d');
        foreach ($cart as $key => $value) {
          $data[] = [
            'product_id' => $cart[$key]->id,
            'order_id' => DB::table('orders')->where('unique_id', '=',$user_id.$date)->select('id')->first()->id,
            'created_at' => $dateNow,
          ];
        }
        DB::table('order_details')->insert($data);
        DB::table('users')->where('id',auth()->user()->id)->update([
          'Longitude' =>$request->longitude,
          'Latitude' => $request->latitude,
        ]);
        Session::forget('cart');
      }else {
        return "hey you are hav`nt a cart to make complate bay process";
      }
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
        //
    }
}
