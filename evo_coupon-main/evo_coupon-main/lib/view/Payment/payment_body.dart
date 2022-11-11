import 'package:evocoupon/view/Payment/payment_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Customer_bloc.dart';
import '../../Bloc/Customer_event.dart';
import '../../Model/Customer.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../size_config.dart';
import '../CustomerMainScreen.dart';
import '../ScreenRoute.dart';

class PaymentBody extends StatefulWidget {
  final String hargaCoupon;
  final CustomerArgument args;
  const PaymentBody({Key key, @required this.hargaCoupon, this.args}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _customer = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  Text(hargaCoupon),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Container(
      child: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Text('terer ${widget.hargaCoupon}'),
              Container(
                margin: getMargin(
                  left: 18,
                  top: 51,
                  right: 18,
                ),
                //TextForm for price START
                child: TextFormField(
                  initialValue: widget.hargaCoupon,
                  enabled: false,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))
                  ],
                  //cursorColor: Colors.redAccent,
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Credit Amount',
                    hintStyle: TextStyle(
                      color: ColorConstant.gray400,
                      fontSize: getFontSize(
                        20,
                      ),
                      fontFamily: 'Trebuchet MS',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'Trebuchet MS',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //TextForm for price END
              ),
              Container(
                margin: getMargin(
                  left: 18,
                  top: 51,
                  right: 18,
                ),
                //TextForm for Plate Number START
                child: TextFormField(
                   initialValue:
                   widget.args.editCust ? widget.args.customer.PlateNumber : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter customer  PlateNumber';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _customer["PlateNumber"] = value;
                  },
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Car Plate Number',
                    hintStyle: TextStyle(
                      color: ColorConstant.gray400,
                      fontSize: getFontSize(
                        20,
                      ),
                      fontFamily: 'Trebuchet MS',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'Trebuchet MS',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //TextForm for plateNum END
              ),
              Container(
                margin: getMargin(
                  left: 18,
                  top: 51,
                  right: 18,
                ),
                //TextForm for Email START
                child: TextFormField(
                  initialValue:
                  widget.args.editCust ? widget.args.customer.PlateNumber : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter customer Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: ColorConstant.gray400,
                      fontSize: getFontSize(
                        20,
                      ),
                      fontFamily: 'Trebuchet MS',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'Trebuchet MS',
                    fontWeight: FontWeight.w400,
                  ),
                  onSaved: (value) {
                    _customer["Email"] = value;
                  },
                ),
                //TextForm for Email END 
              ),
              Container(
                margin: getMargin(
                  left: 18,
                  top: 51,
                  right: 18,
                ),
                //TextForm for ContactNumber START
                child: TextFormField(
                  initialValue:
                  widget.args.editCust ? widget.args.customer.Email : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter PhoneNumber';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //cursorColor: Colors.redAccent,
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Contact Number',
                    hintStyle: TextStyle(
                      color: ColorConstant.gray400,
                      fontSize: getFontSize(
                        20,
                      ),
                      fontFamily: 'Trebuchet MS',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'Trebuchet MS',
                    fontWeight: FontWeight.w400,
                  ),
                  onSaved: (value) {
                    setState(() {
                      _customer["PhoneNum"] = value;
                    });
                  },
                ),
                //TextForm for ContactNumber END
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: getPadding(
                    left: 195,
                    top: 32,
                    right: 9,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: getVerticalSize(
                    74.00,
                  ),
                  width: getHorizontalSize(
                    338.00,
                  ),
                  margin: getMargin(
                    left: 18,
                    top: 44,
                    right: 18,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Please Select Payment Method"),
                          //content: const Text("You have raised a Alert Dialog Box"),
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CustomerMainScreen()));
                                },
                                style: ButtonStyle(
                                  // foregroundColor:
                                  //     MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 128, 1, 137),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(0),
                                  child: const Text(
                                    "Cash",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily: 'Prompt',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.of(context).pushNamed(
                                  //   AddUpdateCustomer.routeName,
                                  //   arguments: CustomerArgument(editCust: false),
                                  // );
                                },
                                style: ButtonStyle(
                                  // foregroundColor:
                                  //     MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 128, 1, 137),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  padding: const EdgeInsets.all(0),
                                  child: const Text(
                                    "Cashless",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily: 'Prompt',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    style: ButtonStyle(
                      // foregroundColor:
                      //     MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 128, 1, 137),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "PAY",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Prompt',
                        ),
                      ),
                    ),
                  ),
                  
                ),
              ),
              //TEST BUTTON
          Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final CustomerEvent event = widget.args.editCust
                          ? CustomerUpdate(

                        Customer(
                        id: widget.args.customer.id,
                        PlateNumber: _customer["PlateNumber"],
                        Email: _customer["Email"],
                        PhoneNum: _customer["PhoneNum"],
                        
                        ),
                      )
                          : CustomerCreate(
                        Customer(
                          PlateNumber: _customer["PlateNumber"],
                          Email: _customer["Email"],
                          
                          PhoneNum: _customer["PhoneNum"], id: _customer["CustomerId"],
                        ),
                      );
                      BlocProvider.of<CustomerBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          CustomerMainScreen.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
              //TEST BUTTON
            ],
          ),
        ),
      ),
    ),
            ],
            
          ),
        ),
      ),
    ),
    );
  }
}
