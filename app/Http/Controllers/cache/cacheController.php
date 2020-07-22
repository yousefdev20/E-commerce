<?php

namespace App\Http\Controllers\cache;

use App\Http\Controllers\Controller;
//use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Request;

class cacheController extends Controller
{
    public function __construct(){
      $this->middleware('auth');
      Artisan::call('optimize:clear');
      return "Artisan::call(optimize:clear); Done!";
    }
    public function index(){
      Artisan::call('optimize:clear');
      Artisan::call('view:clear');
      Artisan::call('cache:clear');
      Artisan::call('route:clear');
      return "Artisan::call(optimize:clear); Done!";
    }
    public function down(){
      $ip = Request::ip();

      /*
      * shall be to use this moethod authonticated
      * with admin roule
      * how i can get ip address
      * form database
      * from request()->id();

      * in foreach request the user or admin maybe take anothere ip address
      * so
      * in database shall be exists ipaddress foreach admin or more ip address
      * foreign key table another table stored all ipaddress
      * in login as an admin
      * get ip address from request Facades class from ip methods or get domain address
      * stored ip has been made server down
      *
      * very important condition
      * shall be allow all admin -
      - use this method via domain address not ip address
      */
      Artisan::call('down --allow='.$ip);
      return redirect()->back();
    }
    public function up(){
      Artisan::call('up');
      return redirect()->back();
    }
}
