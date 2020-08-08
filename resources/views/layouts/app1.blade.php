<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Shops</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link rel="stylesheet" href="{{ url('/css/font-awesome.min.css') }}">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body class="">

<div id="app">
  <div class="">

      </section>
        <nav class="navbar navbar-expand-md navbar-light shadow"style="font-size:17px ;background:white">
            <div class="container">
                <a class="navbar-brand" href="/index">
                    <img src="{{url('/images/logo.png')}}" width="75px"height="75px" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto text-center">
                      <li class="nav-item">
                        <a class="nav-link" href="{{ url('index') }}">Home</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="{{ url('cpanel/mall') }}">Mall</a>
                          <a class="dropdown-item" href="{{ url('cpanel/bakery') }}">Bakery</a>
                          <a class="dropdown-item" href="{{ url('cpanel/shop') }}">Shop</a>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Shop
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="{{ url('RequestQuotation') }}">Shop</a>
                          <a class="dropdown-item" href="{{ url('TechnicalSupport') }}">Wishlist</a>
                          <a class="dropdown-item" href="{{ url('TechnicalSupport') }}">Single Product</a>
                          <a class="dropdown-item" href="{{ url('TechnicalSupport') }}">Cart</a>
                          <a class="dropdown-item" href="checkout.html">Checkout</a>
                        </div>
                      </li>
                      <li class="nav-item"><a href="{{ url('/cpanel/deals/product') }}" class="nav-link">Deals</a></li>
                      <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                      <li class="nav-item">
                        <a class="nav-link" href="{{ url('ContactUs') }}">Contact</a>
                      </li>
                      <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="fa fa-shopping-cart"></span> [<b class="text-danger">0</b>]</a></li>
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                </li>
                            @endif
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>
                                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
              </div>
          </nav>
        </section>
        <main class="pt-1 w-100">
            @yield('content')
        </main>
      </div>
    </div>
  </div>
    <!--End Body-->
</div>
</body>
