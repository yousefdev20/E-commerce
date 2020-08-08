@extends('voyager::master')

@section('content')
    <div class="page-content mt-5 mb-5">
        @include('voyager::alerts')
    <div class="container mt-5">
        <br>
        <a href="{{ url('/admin/order/distributed') }}"class="btn btn-primary"> go to distributed</a>
        <br>
        <br>

        <div class="table-responsive mt-5">
            <table id="dataTable" class="table table-hover mt-5">
                <thead class="bg-danger">
                    <tr>
                        <th class="font-weight-bold"> id </th>
                        <th class="font-weight-bold"> user </th>
                        <th class="font-weight-bold"> phone </th>
                        <th class="font-weight-bold"> created_at </th>
                        <th class="font-weight-bold"> status </th>
                    </tr>
                </thead>
                <tbody>
                @foreach($orders as $key=>$item)
                    <tr>
                        <td>
                            {{$key+1}}
                        </td>
                        <td>
                            {{$item->name}}
                        </td>
                        <td>
                            <a href="tel:{{$item->phone}}">{{ $item->phone  }}</a>
                        </td>
                        <td>
                            {{$item->created_at}}
                        </td>
                        <td>
                            <a href="{{url('/admin/load/order/'.$item->id.'/'.$item->unique_id)}}" class="btn btn-warning w-25">More details</a>
                            <button class="btn btn-primary w-25">End Order</button>
                        </td>

                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
@stop

