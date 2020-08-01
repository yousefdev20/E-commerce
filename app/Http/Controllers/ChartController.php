<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChartController extends Controller
{
    public function index(){
        return view('welcome');
    }
    public function weekly(){
        $obj = [1,2,3];
        return view('welcome')->with('obj',$obj);
    }
    public function deliy(){
        $obj = [1,2,3];
        return view('welcome')->with('obj',$obj);
    }

}
