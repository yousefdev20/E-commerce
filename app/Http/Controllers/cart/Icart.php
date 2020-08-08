
<?php
use Illuminate\Http\Request;

interface Icart {

    public function quantity(Request $req);
    public function TotalPrice();
    public function save(Request $req);
    public function sessionCart();

}
