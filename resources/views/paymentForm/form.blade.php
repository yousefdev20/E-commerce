@section('main')
<script src="https://test.oppwa.com/v1/paymentWidgets.js?checkoutId={{$response}}"></script>
<form action="{{ route('responsePayment') }}" class="paymentWidgets" data-brands="VISA MASTER AMEX"></form>
@endsection
