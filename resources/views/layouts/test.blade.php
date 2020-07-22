<!doctype html>
@if(Session::has('lang'))
@if(Session::get('lang') == 'en')
<html lang="en" dir="ltr">
@else
<html lang="ar" dir="rtl">
@endif
@else
<html lang="en" dir="ltr">
@endif
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="icon" href="{{ asset('/assets/logo.png') }}" type="image/gif" sizes="16x16">
  <title>Online Shopping</title>

  <!-- Scripts -->
  <script src="{{ asset('js/app.js') }}" defer></script>
  <script src="{{ asset('js/kit.fontawesome.js') }}"></script>
  <script src="{{ asset('js/jquery.js') }}" defer></script>
  <!-- Fonts -->
  <link rel="dns-prefetch" href="//fonts.gstatic.com">

  <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <!-- Styles -->
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body style="background:white">
  <div id="app">
    <div class="fixed-top mb-5">
      <!--The Top Nav-->

      <!--The end top nav-->
      <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm border-top border-bottom">
        <div class="container">
          <a class="navbar-brand" href="{{ url('/') }}">
            <img src="{{url('/assets/logo.png')}}" width="75px"height="65px" alt="{{url('/assets/logo.png')}}">
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse w-100" id="navbarSupportedContent">
            <!-- Left Side Of Navbar -->
            <ul class="navbar-nav mr-auto w-100 mt-3">
              <div class="w-50 ml-5 mt-2">
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="{{ __('nav.search') }}">
                  <div class="input-group-append">
                    <button class="btn btn-primary text-light" type="submit"><span class="fa fa-search"></span> </button>
                  </div>
                </div>
              </div>

              <div class="text-center mt-2 ml-4 "id="cart">
              </li>
              <li class="nav-item cta cta-colored">
                <a href="{{ url('/shopping/cart/load') }}" class="nav-link">
                  <h5><span class="fa fa-shopping-cart"></span>[<b id="counterofitems" class="text-danger"value="0">0</b>]</h5>
                </a>
              </li>

            </div>
            <div class="text-center mt-2 ml-4 text-secondary"id="lang">
              <li class="nav-item dropdown">
                <a class="nav-link " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                  @if(Session::get('lang') == 'en')
                  {{ Session::get('lang') }}
                  <img src="{{ asset('flags/Flag_of_the_United_States.svg')}}" width="25px"height="25px"alt="error">

                  @else
                  {{ Session::get('lang') }}
                  <img src="{{ asset('flags/Flag_of_Jordan.svg')}}" width="25px"height="25px"alt="error">


                  @endif
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="{{ route('ar') }}">arbic  <img src="{{ asset('flags/Flag_of_Jordan.svg')}}" width="25px"height="25px"alt="error"></a>
                  <a class="dropdown-item" href="{{ route('en') }}">english  <img src="{{ asset('flags/Flag_of_the_United_States.svg')}}" width="25px"height="25px"alt="error"></a>

                </div>
              </li>

            </div>
          </ul>


          <!-- Right Side Of Navbar -->
          <ul class="navbar-nav ml-auto">
            <!-- Authentication Links -->
            @guest
            <li class="nav-item">
              <a class="nav-link" href="{{ route('login') }}">{{ __('auth.Login') }}</a>
            </li>
            @if (Route::has('register'))
            <li class="nav-item">
              <a class="nav-link" href="{{ route('register') }}">{{ __('auth.Register') }}</a>
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
  <!--second navbar-->
  <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm font-weight-bold">
    <div class="container">
      <a class="navbar-brand text-primary item-brand" href="{{ url('/shopping/cart/load') }}">
        {{ __('nav.cart')}}
      </a>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!-- Left Side Of Navbar -->
        <ul class="navbar-nav mr-auto text-center">
          <li class="nav-item">
            <a class="nav-link" href="{{ url('/') }}">{{ __('nav.home') }}</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              {{ __('nav.products') }}
            </a>
            <div class="dropdown-menu overflow-auto" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="{{ url('goods/mall') }}">Mall</a>
              <a class="dropdown-item" href="{{ url('goods/bakery') }}">Bakery</a>
              <a class="dropdown-item" href="{{ url('goods/shops') }}">Shop</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              {{ __('nav.shop') }}
            </a>
            <div class="dropdown-menu anyClass" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="{{ url('/shopping/shop') }}">Shop</a>
              <a class="dropdown-item" href="{{ url('TechnicalSupport') }}">Wishlist</a>
              <a class="dropdown-item" href="{{ url('TechnicalSupport') }}">Single Product</a>
              <a class="dropdown-item" href="{{ url('/shopping/cart') }}">Cart</a>
              <a class="dropdown-item" href="checkout.html">Checkout</a>
            </div>
          </li>
          <li class="nav-item"><a href="about.html" class="nav-link">{{ __('nav.about') }}</a></li>
          <li class="nav-item">
            <a class="nav-link" href="{{ url('ContactUs') }}">{{ __('nav.contact') }}</a>


            <!-- Right Side Of Navbar -->
          </div>
        </div>
      </nav>
    </div>
    <!---->
    <main class="py-1" style="margin-top:150px">
      @yield('content')
    </main>
  </div>
</body>
</html>
