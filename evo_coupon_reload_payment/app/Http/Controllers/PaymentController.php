<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Parking;
use App\Models\Customer;
use Illuminate\Support\Str;
use Illuminate\Routing\Controller;
use App\Http\Requests\StoreCustomerRequest;
use App\Http\Requests\UpdateCustomerRequest;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function payment()
    {
        return view('payment.index');

    }

    public function paymentType(Request $request)
    {
        $but_amount = $request->post('total');
        $custom_amount = $request->post('custom_amount');
        $total_amount = null; 

        if(isset($custom_amount))
        {
            $total_amount = $custom_amount * 100;
        }

        else if(isset($but_amount))
        {
            $total_amount = $but_amount;
        }
        //dd($total_amount);
        return view('payment.payment_type',compact('total_amount'));
    }
     
}
