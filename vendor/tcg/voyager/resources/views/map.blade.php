@extends('voyager::master')

@section('content')
<div class="page-content mt-5 mb-5">
  @include('voyager::alerts')
  <div class="container mt-5">
    {{ $position }}
    <div id="map"></div>
    <head>
      <script>
      document.getElementById('map').innerHTML=' <div class="mapouter"><div class="gmap_canvas"><iframe width="100%"height="'+window.innerHeight+'"	 id="gmap_canvas" src="https://maps.google.com/maps?q=%20+'+{{ $position[0]->Latitude }}+'%20%2C%20'+{{ $position[0]->Longitude }}+'&t=&z=18&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="yes" marginheight="0" marginwidth="0"></iframe></div><style>.mapouter{position:relative;textalign:right;height:500px;width:100%;}.gmap_canvas{overflow:hidden;background:none!important;height:500px;width:1200px;}<style></div>';
      </script>
    </head>
    <body>
      <div id="map"></div>
    </body>
  </div>
</div>
@stop
