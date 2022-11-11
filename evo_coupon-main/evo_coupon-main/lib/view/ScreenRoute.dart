import 'package:evocoupon/view/CustomerCreateUpdateScreen.dart';
import 'package:flutter/material.dart';
import 'package:evocoupon/view/CustomerMainScreen.dart';
//import 'package:evocoupon/view/ServiceCreateUpdateScreen.dart';
import 'package:evocoupon/Service.dart';
import 'package:evocoupon/view/Payment/payment_screen.dart';

//import 'CustomerCreateUpdateScreen.dart';
import 'CustomerDetailScreen.dart';

class ServiceAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => HomeScreen());
    }
    if (settings.name == 'loginScreen') {
      return MaterialPageRoute(builder: (context) => LoginScreen());
    }

    if (settings.name == 'homescreen') {
      return MaterialPageRoute(builder: (context) => HomeScreen());
    }

    // if (settings.name == AddUpdateCustomer.routeName) {
    //   CustomerArgument args = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => AddUpdateCustomer(
    //             args: args,
    //           ));
    // }

    if (settings.name == CustomerDetail.routeName) {
      Customer customer = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => CustomerDetail(
                customer: customer,
              ));
    }

    if (settings.name == CustomerMainScreen.routeName) {
      return MaterialPageRoute(builder: (context) => CustomerMainScreen());
    }

    if (settings.name == PaymentScreen.routeName) {
      CustomerArgument args = settings.arguments;
      //String hargaCoupon = null;

      return MaterialPageRoute(
        builder: (context) => PaymentScreen(
          //hargaCoupon: null,
          args: args,
        ),
      );
    }

    return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}

class CustomerArgument {
  final Customer customer;
  final bool editCust;
  final String hargaCoupon;
  CustomerArgument({this.customer, this.editCust, this.hargaCoupon});
}
