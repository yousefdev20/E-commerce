<?php

namespace App\Http\Controllers\lang;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class langController extends Controller
{
    public function ar(Request $req){

        config(['app.dir'=>'rtl']);
        App::setLocale('ar');
        $req->session()->put('lang','ar');
        $req->session()->put('dir','rtl');
        return redirect()->back();
    }
    public function en(Request $req){

        config(['app.dir'=>'ltr']);
        App::setLocale('en');
        $req->session()->put('lang','en');
        $req->session()->put('dir','ltr');
        return redirect()->back();

    }
}
