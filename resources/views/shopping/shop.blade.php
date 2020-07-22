@extends('layouts.test')

@section('content')
<div id="app">
{{ App::setLocale(Session::get('lang')) }}
    <section class="ftco-section mt-3">
      <div class="container">
        <h5>
          @foreach($categories as $key => $item)
            @if(count($categories) == $key+1)
              <a href="#" class="mr-3">{{ $item->branche_name }} </a>
            @else
              <a href="#" class="mr-3">{{ $item->branche_name }} < </a>
            @endif
          @endforeach
        </h5>
        <div class="row justify-content-center pb-3">
          <div class="col-md-12 heading-section ftco-animate">
            @if(Session::get('lang') == 'ar')
            <h2 class="mb-4 text-dark font-weight-bold display-5 float-right">
              @else
              <h2 class="mb-4 text-dark font-weight-bold display-5 float-left">
            @endif
              {{ __('main.shops') }}
            </h2>
          </div>
        </div>
      </div>
      <div class="container mb-5">
        <shops></shops>
      </div>
    </section>
  <div class="">
    <h6 class="text-center text-secandary">© 2020 <a href="tel:0790402732"class="text-secandary">Y.M.S</a>, Information Technology & Communications Center. All Rights Reserved.</h6>
  </div>
</div>
@endsection
