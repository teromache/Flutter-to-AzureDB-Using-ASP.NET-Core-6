@extends('layouts.main')
@section('content')
<!-- @if ($errors->any())
    <div class="alert alert-danger mt-2">
        <strong>Whoops!</strong> There were some problems with your input.<br><br>
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif -->
<form action="{{ route('payment_type') }}" method="POST">
@csrf
<div class="row mt-4 justify-content-center">

        <!-- @csrf
        @php
            if(isset($_GET['contact_num'])){
                $phone = $_GET['contact_num'];
                $plate = $_GET['vehicle_num'];
                $starttime = $_GET['starttime'];

            }
        @endphp -->
        <!--hidden-->
        <input type="text" name="contact_num" class="form-control" value="" hidden>
        <input type="text" name="vehicle_num" class="form-control" value="" hidden>
        <input type="text" name="starttime" class="form-control" value="" hidden>

    <div class="col-lg-9 text-primary">
        <h1 class="mb-2 font-weight-bold">RELOAD</h1>
        <!-- <h6 class="mb-4 font-weight-bold">Let’s decide your parking time</h6> -->
        <hr>
    </div>

    <!-- Current Date and Time -->
    <!-- <div class="col-lg-2 text-primary">

        <div >
            <h6 class="h4 mb-2 font-weight-bold"> START TIME</h6>
            <h4 class="font-weight-bold">{{ now() }}</h4>
            <script>
                document.getElementById("currentDateTime").value = "<?php $starttime?>";
            </script>
        </div>
</div> -->

<div class="col-lg-9 text-primary">
     
    <h6 class="h4 mt-2">Enter your amount: </h6>

    <!-- Collapsable Card Example -->
    <div class="card mb-3" style="border: 4px solid  #862880; border-radius: 0.75rem;">

        <!-- Card Header - Accordion -->
        <a class="d-block card-header bg-primary py-3">
            <input type="number" id="amount" oninput='document.getElementById("totalDisplay").value = "RM " + this.value' class="form-control" name="custom_amount" placeholder="Enter amount here" style="text-align:center;font-size:17pt;">
            <!-- <button class="btn btn-secondary px-3 mt-1 mb-1" type="button" name="amount" onclick="check(document.getElementById('x'))">OK</button> -->
        </a>

        <div class="row mt-4 mx-auto">
            <p >OR SELECT AMOUNT BELOW</p>
        </div>

        <!-- Card Content - Collapse -->
            <div class="card-body">
                <center>
                    <button class="btn btn-secondary mt-1 mb-1" type="button" name="amount"  onclick="check(this.value)" value="10000">RM 100</button>
                    <button class="btn btn-secondary mt-1 mb-1" type="button" name="amount"  onclick="check(this.value)" value="20000">RM 200</button>
                    <button class="btn btn-secondary mt-1 mb-1" type="button" name="amount"  onclick="check(this.value)" value="30000">RM 300</button>
                    <button class="btn btn-secondary mt-1 mb-1" type="button" name="amount"  onclick="check(this.value)" value="50000">RM 500</button>
                    <button class="btn btn-secondary mt-1 mb-1" type="button" name="amount"  onclick="check(this.value)" value="100000">RM 1000</button>
                    <button class="btn btn-secondary mt-1 mb-1" type="button" name="amount"  onclick="focusInput()">Other</button>
                   
                    <input class="form-control mt-2" type="integer" name="duration" id="duration" hidden>
            </div>
        </div>
    </div>

    <!-- <div class="input-group mt-3 mb-3 text-center">
        <div class="input-group-prepend">
          <span class="input-group-text bg-primary text-white">ENDS AT</span>
        </div>
        <input type="text" class="text-primary form-control" name="endtime" id="endtime" class="" disabled>
    </div> -->

    <div class="input-group mt-3 mb-3 justify-content-center">
                <input type="text" class="form-control bg-primary text-white font-weight-bold text-center" style="border-top-right-radius: 5rem;
                border-bottom-right-radius: 5rem; font-size:35px" name="total" id="totalDisplay" disabled>
                <input type="text" name="total" id="total" hidden>
    </div>

    <center>
        <button type="submit" class="btn btn-primary mb-4">
            PROCEED
        </button>

    </center>
</form>
</div>

</div>
<!-- /.container-fluid -->

</div>

<!-- /.container-fluid -->

</div>
@endsection



<script type="text/javascript">
    function check(amount) {

        document.getElementById("total").value = amount;
        document.getElementById("totalDisplay").value = "RM " + amount/100;
        document.getElementById("amount").value = " ";
        }

    function focusInput()
    {
        document.getElementById("amount").focus();
    }
</script>
