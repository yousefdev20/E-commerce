@extends('layouts.test')

@section('content')
<div id="app">
{{ App::setLocale(Session::get('lang')) }}
  <section>
   <div id="carouselExampleIndicators" class="carousel slide " data-ride="carousel">
     <ol class="carousel-indicators">
       @foreach($sliders as $key=>$item)
       <li data-target="#carouselExampleIndicators" data-slide-to="{{$key-1}}"></li>
       @endforeach
     </ol>
     <div class="carousel-inner mh-50">
       @foreach($sliders as $key=>$item)
         @if($key == 0)
           <div class="carousel-item active">
            <img class="d-block w-100 cus-height" src="{{url('storage/'.$item->image_url)}}"width="100%" alt="First slide"height="570px">
            <div class="carousel-caption">
                <h2 class="display-4">{{$item->name}}</h2>
                <h4>{{ $item->description }}</h4>
            </div>
           </div>
          @else

           <div class="carousel-item">
            <img class="d-block w-100 cus-height" src="{{url('storage/'.$item->image_url)}}"width="100%" alt="Second slide"height="570px">
            <div class="carousel-caption">
              <h2 class="display-4">{{$item->name}}</h2>
              <h4>{{ $item->description }}</h4>
            </div>
           </div>
   @endif
     @endforeach
     </div>
     <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
       <span class="carousel-control-prev-icon" aria-hidden="true"></span>
       <span class="sr-only">Previous</span>
     </a>
     <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
       <span class="carousel-control-next-icon" aria-hidden="true"></span>
       <span class="sr-only">Next</span>
     </a>
   </div>
 </section>
 <!-- fixed section -->
 <section class="mt-5 mb-5 text-center">
   <div class="container">
     <div class="row pt-5 text-center font-weight-bold pb-3 ">
       <div class="col-lg-1 pl-3">
       </div>
       <div class="col-lg-3 pl-3">
         <h3 class="display-4"><span class="fas fa-shipping-fast"></span></h3>
         <h5 class="font-weight-bold">Free Shipping</h5>
         <span>On order over $50</span>
       </div>
       <div class="col-lg-3 pl-3">
         <h3 class="display-4"><span class="fas fa-award text-primary"></span></h3>
         <h5 class="font-weight-bold">SUPERIOR QUALITY</h5>
         <span>QUALITY PRODUCTS</span>
       </div>
       <div class="col-lg-3">
         <h3 class="display-4"><span class="fas fa-carrot text-danger"></span></h3>
         <h5 class="font-weight-bold">ALWAYS FRESH</h5>
         <span>PRODUCT WELL PACKAGE</span>
       </div>
     </div>
   </div>

 </section>
<!-- fixed section -->
	<!--<section>
		<div class="container mt-5 mb-5">
			<div class="row">
        <div class="col-lg-4 col-md-3">
          <a href="{{ url('/shopping/shop') }}">
          <img src="/images/category-2.jpg" class="img-thumbnail rounded w-100 h-100 " alt="">
          </a>
        </div>

        <div class="col-lg-4 col-md-3">
          <a href="{{ url('shopping/mall') }}">
          <img src="/images/category-4.jpg" class="img-thumbnail rounded w-100 h-100 " alt="">
          </a>
        </div>

        <div class="col-lg-4 col-md-3">
          <a href="{{ url('shopping/bakery') }}">
          <img src="/images/bread2.jpg" class="img-thumbnail rounded w-100 h-100 " alt="">
          </a>
        </div>
  </div>
</div>
	</section>
-->
  <!--Best Deals-->
    <section class="ftco-section"style="margin-top:150px">
      <div class="container">
        <div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
            <span class="text-success display-5 mb-5">Featured Products</span>
            <h2 class="mb-4 text-dark font-weight-bold display-5 mt-3">
              {{ __('main.bestdeals') }}
            </h2>
            <p class="text-secondary">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
          </div>
        </div>
      </div>
      <div class="container mb-5">
        <deals></deals>
      </div>
    </section>


<section class="ftco-section"style="margin-top:150px">
  <div class="container">
    <div class="row justify-content-center mb-3 pb-3">
      <div class="col-md-12 heading-section text-center ftco-animate">
        <span class="text-success display-5 mb-5">Featured Products</span>
        <h2 class="mb-4 text-dark font-weight-bold display-5 mt-3">
          {{ __('main.more_popular') }}
        </h2>
        <p class="text-secondary">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
      </div>
    </div>
  </div>
  <div class="container mb-5">
    <popular></popular>
  </div>
</section>


  <section class="ftco-section"style="margin-top:150px">
  	<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
        <div class="col-md-12 heading-section text-center ftco-animate">
        	<span class="text-success display-5 mb-5">Featured Products</span>
          <h2 class="mb-4 text-dark font-weight-bold display-5 mt-3">{{ __('main.ourproducts') }}</h2>
          <p class="text-secondary">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
        </div>
      </div>
  	</div>
  	<div class="container mb-5">
      <div class="table-responsive">

      </div>
      <products></products>
		</div>
  </section>

	<section class="py-5 bg-light">
    <div class="container">
      <div class="row d-flex py-5">
        <div class="col-md-6">
        	<h2 style="font-size: 22px;" class="mb-0">{{ __('main.subcribe_to_our_newsletter') }}</h2>
        	<span>{{ __('main.mobile_app_description') }}</span></br>
          <img class="mt-5"src="assets/google_play.svg" dir='rtl' alt="there is some error">
        </div>
      </div>
    </div>
  </section>
  <!--Footer-->
  <div class="jumbotron mt-5 mb-0 bg-light font-weight-bold text-dark">
    <div class="row">
      <div class="col-lg-1">

      </div>
      <div class="col-lg-4 text-center text-dark">
        <img src="{{ asset('assets/logo.png')}}" height="130px"width="130px" style="border-radius:50px"><br>
        <a href="#"><h6 class="pt-2"><span class="glyphicon glyphicon-star"></span> </h6></a>
        <a href="ContactUs"><h6 class="pt-3 text-dark">conntact us</h6></a>
        <a href="ContactUs"><h6 class="text-dark">help</h6></a>
        <h6 class="text-dark">
          <a href="#"class="text-dark"><span class="fa fa-facebook-square"style="font-size:25px"></span> </a>
          <a href="#"class="text-dark"><span class="fa fa-twitter-square"style="font-size:25px"></span> </a>
          <a href="#"class="text-dark"><span class="fa fa-whatsapp"style="font-size:25px"></span> </a>
        </h6>
      </div>
      <div class="col-lg-3 text-center">
        <h3 class="font-weight-bold text-dark mb-3">Contact Emrann Mall</h3>
        <div class=""style="font-size:12px;">
            <h6>Phone 1 : <a href="tel:0790402732">9627 9040 2732</a></h6>
        </div>
        <div class=""style="font-size:12px;">
            <h6>Phone 1 : <a href="tel:0790402732">9627 9040 2732</a></h6>
        </div>
        <div class=""style="font-size:12px;">
            <h6>Phone 1 : <a href="tel:0790402732">9627 9040 2732</a></h6>
        </div>
      </div>
      <div class="col-lg-3 text-center">
        <h3 class="font-weight-bold text-dark">Newsletter</h3>
        <h6>Enter your email address to get the latest Company news, special events and employee activities delivered right to your inbox.</h6>
        <button type="button" class="btn btn-outline-dark w-100 mt-4">Subscribe to Emrann Newsletter</button>
      </div>
      <div class="col-lg-1">
      </div>
    </div>
  </div>
  <div class="">
    <h6 class="text-center text-secandary">© 2020 <a href="tel:0790402732"class="text-secandary">Y.M.S</a>, Information Technology & Communications Center. All Rights Reserved.</h6>
  </div>
</div>
@endsection
