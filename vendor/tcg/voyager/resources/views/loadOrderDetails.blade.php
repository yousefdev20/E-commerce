@extends('voyager::master')

@section('content')
    <div class="page-content mt-5 mb-5">
        @include('voyager::alerts')
    <div class="container mt-5">
        <br>
        <a href="{{ url('/admin/load/order') }}" class="btn btn-warning">return to list</a>
        <a href="tel:{{ $user[0]->customer_phone }}" class="btn btn-success">Call <img src="https://img.icons8.com/windows/32/000000/phone-disconnected.png"/> </a>
        <br>
        <br>
        <div class="table-responsive mt-5">
            <table id="dataTable" class="table table-hover mt-5">
                <thead class="bg-danger">
                    <tr>
                        <th class="font-weight-bold"> id </th>
                        <th class="font-weight-bold"> product </th>
                        <th class="font-weight-bold"> product name </th>
                        <th class="font-weight-bold"> price </th>
                        <th class="font-weight-bold"> weight_id </th>
                        <th class="font-weight-bold"> branch_id </th>
                    </tr>
                </thead>
                <tbody>
                @foreach($orders as $key=>$item)
                    <tr>
                        <td>
                            {{$key+1}}
                        </td>
                        <td>
                            <img src="{{ Voyager::image( $item->image_url )  }}" alt="{{ url($item->image_url)  }}" width="100px" height="50px">
                        </td>
                        <td>
                            {{$item->name}}
                        </td>
                        <td>
                            {{$item->price}}
                        </td>
                        <td>
                            {{$item->weight_id}}
                        </td>
                        <td>
                            {{$item->branch_id}}
                        </td>

                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
        <a href="{{ url('admin/order/orderFinish/'.$orders[0]->order_id) }}"class="btn btn-danger float-right">Order Finish</a>
    </div>
@stop

