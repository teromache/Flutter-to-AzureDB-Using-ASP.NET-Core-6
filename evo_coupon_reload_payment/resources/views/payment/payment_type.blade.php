@extends('layouts.main')

@section('content')
<div class="card mt-4 mb-4">
    <div class="card-header bg-light">
        <h1 class="font-weight-bold mt-3 text-primary">PAYMENT</h1>
        <span class="text-primary">Proceed to payment</span>
    </div>

            @php
                    $purchaseRef = rand();
                    $password = "d9c6e2d9fabf2619ec15fb5f3c30526a759c8a3eb34c1b3a872351842cd846a5";
                    $merchantName= "SMART INTEGRA";
                    $hash = $purchaseRef.$password.$merchantName ;
                    $hashkey = hash("sha256", $hash);
                    
            
            @endphp

    <div class="card-body bg-light">
        <h5 class="text-primary font-weight-bold">Payment method</h5>
        <div class="card mb-3">
            <br>
            <img class="card-img-top mx-auto d-block" src="{{ asset("admin/img/fpx.png") }}" style="width: 200px; height: auto;">
            <div class="card-body">
            <form action="https://stg-onlinepayment.ampersandpay.com/Listener/" method="post">
                    <input type="hidden" name="HostId" value="80410102" />
                    <input type="hidden" name="Hashkey"
                    value="{{ $hashkey }}" />
                    <input type="hidden" name="Currency" value="MYR" />
                    <input type="hidden" name="Amount" value="{{ $total_amount }}" />
                    <input type="hidden" name="IPAddress" value="211.49.33.122" />
                    <input type="hidden" name="PurchaseDate" value="10/03/2022 17:22:33" />
                    <input type="hidden" name="PurchaseDescription" value="Reload Balance" />
                    <input type="hidden" name="PurchaseReference" value="{{ $purchaseRef }}" />
                    <input type="hidden" name="Products[0].name" value="Reload Balance" />
                    <input type="hidden" name="Products[0].amount" value="{{ $total_amount }}" />
                    <input type="hidden" name="UrlError"
                    value="https://stg-onlinepayment.ampersandpay.com/Listener/mockup/fail" />
                    <input type="hidden" name="UrlSuccess"
                    value="https://parkingreceipt.000webhostapp.com/" />
                    <input type="hidden" name="CountryCode" value="MY" />
                    <input type="hidden" name="FirstName" value="fname" />
                    <input type="hidden" name="LastName" value="lname"/>
                    <input type="hidden" name="Email" value="test@gmail.com"/>
                    <input type="hidden" name="DirectPay" value="1"/>
                    <button type="submit" class="btn btn-primary btn-block">FPX Check Out</button>
                </form>
            </div>
        </div>
        </div>
    </div>
</div>

@endsection
