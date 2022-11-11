import 'package:evocoupon/view/ScreenRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evocoupon/Bloc/bloc.dart';
import 'package:evocoupon/view/CustomerMainScreen.dart';
import 'package:evocoupon/view/screen.dart';
import 'package:evocoupon/Service.dart';



class AddUpdateCustomer extends StatefulWidget {
  static const routeName = 'customerAddUpdate';
  final CustomerArgument args;

  AddUpdateCustomer({ this.args});
  @override
  _AddUpdateCustomerState createState() => _AddUpdateCustomerState();
}

class _AddUpdateCustomerState extends State<AddUpdateCustomer> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _customer = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.editCust ? "Edit Customer" : "Add New Customer"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                  initialValue:
                  widget.args.editCust ? widget.args.customer.PlateNumber : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter customer  PlateNumber';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'PlateNumber'),
                  onSaved: (value) {
                    this._customer["PlateNumber"] = value;
                  }),


                  TextFormField(
                  initialValue:
                  widget.args.editCust ? widget.args.customer.PlateNumber : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter customer Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) {
                    this._customer["Email"] = value;
                  }),

              TextFormField(
                  initialValue: widget.args.editCust ? widget.args.customer.Email : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter PhoneNumber';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  onSaved: (value) {
                    setState(() {
                      this._customer["PhoneNum"] = value;
                    });
                  }),
              
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
                        PlateNumber: this._customer["PlateNumber"],
                        Email: this._customer["Email"],
                        PhoneNum: this._customer["PhoneNum"],
                        
                        ),
                      )
                          : CustomerCreate(
                        Customer(
                          PlateNumber: this._customer["PlateNumber"],
                          Email: this._customer["Email"],
                          
                          PhoneNum: _customer["PhoneNum"], id: this._customer["CustomerId"],
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

            ],
          ),
        ),
      ),
    );
  }
}
