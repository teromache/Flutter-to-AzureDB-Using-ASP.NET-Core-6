import 'package:evocoupon/view/CustomerMainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evocoupon/Bloc/bloc.dart';
import 'package:evocoupon/Model/models.dart';
//import 'package:evocoupon/view/ServiceCreateUpdateScreen.dart';
import 'package:evocoupon/view/screen.dart';

class CustomerDetail extends StatelessWidget {
  static const routeName = 'customerDetail';
  final Customer customer;

  CustomerDetail({ this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.customer.Email}'),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AddUpdateCustomer.routeName,
                  arguments: CustomerArgument(customer: this.customer, editCust: true),
                );
              }),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<CustomerBloc>(context)
                    .add(CustomerDelete(customer));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    CustomerMainScreen.routeName, (route) => true);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Customer Email: ${customer.Email}'),
              subtitle: Text('Plate Number: ${customer.PlateNumber}'), 
              
            ),
            Text(
              'Plate Number: ${customer.PlateNumber}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Customer Email: ${customer.Email}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Phone Number: ${customer.PhoneNum}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
