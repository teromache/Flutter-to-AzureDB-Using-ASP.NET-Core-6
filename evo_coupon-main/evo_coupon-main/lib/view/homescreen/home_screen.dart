import 'package:evocoupon/view/homescreen/home_body.dart';
import 'package:flutter/material.dart';

import 'package:evocoupon/core/constants/routes.dart';
//import 'package:evocoupon/size_config.dart';

import '../Payment/payment_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const routeName = 'homescreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 129, 6, 150),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeBody(),
              
            ],
          ),
        ),
      )),
    );
  }
}
