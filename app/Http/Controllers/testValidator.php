<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Rules\phone;
use App\Rules\phonelength;
use App\Http\Requests\RequestForm;

class testValidator extends Controller
{
    public function index(RequestForm $req){
		return $req;
				
	}
}
