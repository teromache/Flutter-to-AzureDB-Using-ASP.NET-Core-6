import 'package:evocoupon/view/DailySale/dailysale_body.dart';
import 'package:flutter/material.dart';

class DailySaleScreen extends StatelessWidget {
  const DailySaleScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Daily Sales',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Prompt',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 129, 6, 150),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DailySaleBody(),
            ],
          ),
        ),
      )),
    );
  }
}
