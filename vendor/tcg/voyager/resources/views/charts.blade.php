@extends('voyager::master')

@section('content')
    <div class="page-content mt-5">
        @include('voyager::alerts')
        <form action="" method="GET">
            <div class="container w-25">
                <input name="from" type="date" class="form-control w-25"/>
                <br>
                <input class="form-control" id="datefield" type='date' min='2019-01-01' max='2020-12-31'></input>
            </div>
            <button type="submit" class="btn btn-primary  w-25">Click</button>
        </form>
        <div class="table-responsive">
            <div id="chart" class="container mt-5" style="height: 300px;"></div>
        </div>
        <!-- Charting library -->
        <script src="https://unpkg.com/echarts/dist/echarts.min.js"></script>
        <!-- Chartisan -->
        <script src="https://unpkg.com/@chartisan/echarts/dist/chartisan_echarts.js"></script>
        <!-- Your application script -->
        <script>
            const chart = new Chartisan({
                el: '#chart',
                url: "@chart('sample_chart')",
            });
        </script>
</div>
@stop

