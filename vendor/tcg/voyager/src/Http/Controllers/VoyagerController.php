<?php

namespace TCG\Voyager\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Constraint;
use Intervention\Image\Facades\Image;
use League\Flysystem\Util;
use TCG\Voyager\Facades\Voyager;

class VoyagerController extends Controller
{
  public function index()
  {
    //return Voyager::view('voyager::index');
    return Voyager::view('voyager::index');
  }

  public function logout()
  {
    Auth::logout();

    return redirect()->route('voyager.login');
  }

  public function upload(Request $request)
  {
    $fullFilename = null;
    $resizeWidth = 1800;
    $resizeHeight = null;
    $slug = $request->input('type_slug');
    $file = $request->file('image');

    $path = $slug.'/'.date('F').date('Y').'/';

    $filename = basename($file->getClientOriginalName(), '.'.$file->getClientOriginalExtension());
    $filename_counter = 1;

    // Make sure the filename does not exist, if it does make sure to add a number to the end 1, 2, 3, etc...
    while (Storage::disk(config('voyager.storage.disk'))->exists($path.$filename.'.'.$file->getClientOriginalExtension())) {
      $filename = basename($file->getClientOriginalName(), '.'.$file->getClientOriginalExtension()).(string) ($filename_counter++);
    }

    $fullPath = $path.$filename.'.'.$file->getClientOriginalExtension();

    $ext = $file->guessClientExtension();

    if (in_array($ext, ['jpeg', 'jpg', 'png', 'gif'])) {
      $image = Image::make($file)
      ->resize($resizeWidth, $resizeHeight, function (Constraint $constraint) {
        $constraint->aspectRatio();
        $constraint->upsize();
      });
      if ($ext !== 'gif') {
        $image->orientate();
      }
      $image->encode($file->getClientOriginalExtension(), 75);

      // move uploaded file from temp to uploads directory
      if (Storage::disk(config('voyager.storage.disk'))->put($fullPath, (string) $image, 'public')) {
        $status = __('voyager::media.success_uploading');
        $fullFilename = $fullPath;
      } else {
        $status = __('voyager::media.error_uploading');
      }
    } else {
      $status = __('voyager::media.uploading_wrong_type');
    }

    // echo out script that TinyMCE can handle and update the image in the editor
    return "<script> parent.helpers.setImageValue('".Voyager::image($fullFilename)."'); </script>";
  }

  public function assets(Request $request)
  {
    try {
      $path = dirname(__DIR__, 3).'/publishable/assets/'.Util::normalizeRelativePath(urldecode($request->path));
    } catch (\LogicException $e) {
      abort(404);
    }

    if (File::exists($path)) {
      $mime = '';
      if (Str::endsWith($path, '.js')) {
        $mime = 'text/javascript';
      } elseif (Str::endsWith($path, '.css')) {
        $mime = 'text/css';
      } else {
        $mime = File::mimeType($path);
      }
      $response = response(File::get($path), 200, ['Content-Type' => $mime]);
      $response->setSharedMaxAge(31536000);
      $response->setMaxAge(31536000);
      $response->setExpires(new \DateTime('+1 year'));

      return $response;
    }

    return response('', 404);
  }
  public function test(Request $request){
    $sum = DB::table('products')
    ->join('order_details','products.id','=','order_details.product_id')
    ->select(DB::raw('sum(price) as summation'))
    ->get();


    /*
    *
    * there some code for test to make subquery to make join with two tables
    *
    * */

    if(isset(auth()->user()->role_id) && auth()->user()->role_id == 1){
      $obj = [1,2,3,auth()->user()];
      return Voyager::view('voyager::charts')->with('obj', $obj);

    }else
    {
      $arr = ["intended" => "http://192.168.8.107:8000/admin/test"];
      Session::put('url',$arr);
      return Voyager::view('voyager::login');
    }


    // Check permission


  }
  public function loadOrders(Request $request) {
    /*return DB::table('orders')
    ->get();*/
    $orders = DB::table('orders')
    ->join('users','orders.user_email','=','users.id')
    ->select('orders.id','users.name','orders.created_at', 'users.phone','unique_id')
    ->where('status',2)
    ->get();
    return Voyager::view('voyager::loadOrders')->with('orders',$orders);
    //return $request;
  }
  public function loadOrderDetails(Request $request, $id, $unique_id){
    $order_details = collect(DB::table('order_details')
    ->where('order_id',$id)
    ->join('products','order_details.product_id','=','products.id')
    ->select('name', 'image_url', 'price', 'weight_id', 'branch_id', 'order_id')
    ->orderBy('products.id')
    ->get());
    //return $order_details;
    $user = collect(DB::table('orders')
    ->join('users','orders.user_email','=','users.id')
    ->select('users.phone as customer_phone', 'users.name as customer_name')
    ->where('orders.id',$id)
    ->get());
    //return $user;
    return Voyager::view('voyager::loadOrderDetails')
    ->with('orders',collect($order_details))
    ->with('user',$user);
  }
  public function orderFinish(Request $request, $id) {
    /*
    * status 1 that is means (Done) has been paid
    * status 2 that is means (Watting) To The Drive take this Order
    * status 3 that is means (Block) has been cheated
    * status 4 that is means (bought) the Driver had bought Order
    * */
    DB::table('orders')
    ->where('id', $id)
    ->update(['status' => 4]);
    return redirect('admin/load/order');
  }
  public function distributed(Request $request) {
    $orders = DB::table('orders')
    ->join('users','orders.user_email','=','users.id')
    ->select('orders.id','users.name','orders.created_at', 'users.phone','unique_id','users.id as user_id')
    ->where('status',4)
    ->get();
    return Voyager::view('voyager::distributed')->with('orders',$orders);
  }
  public function LoadMap(Request $request, $id) {
    if(DB::table('orders')->where('status',4)->where('user_email',$id)->exists()){
      $position = DB::table('users')->where('id',$id)->select('Longitude','Latitude')->get();
      return Voyager::view('voyager::map')->with('position', $position);
    }else{
      return abort(404);
    }
  }
}
