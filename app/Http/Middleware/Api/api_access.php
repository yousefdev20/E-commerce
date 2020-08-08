<?php

namespace App\Http\Middleware\Api;

use Closure;

class api_access
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
    	if($request->Api_Who_Am_I == env('Api_User_Secret_key', 'gVFEE1Ok08bvQiO6MbcNfqt8EIoGyayPA34GMTQFLiIJsYyB5jsxFN2XiIC6T296$YOUSEF')) {
	  return $next($request);
    	
    	}else {
          return response()->json("UnAuthenticated!");
	}

    }
}
