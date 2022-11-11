import 'package:evocoupon/core/constants/routes.dart';
import 'package:evocoupon/view/Payment/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicons/unicons.dart';

import '../screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  FocusNode focusNode1;
  //late final String hargaCoupon;
  final _controller = TextEditingController();
  //final fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();

    // To manage the lifecycle, creating focus nodes in
    // the initState method
    focusNode1 = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus nodes
    // when the form is disposed
    focusNode1.dispose();
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 129, 6, 150),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 30, 0, 0),
                          child: Text(
                            "Coupon Type",
                            style: TextStyle(
                              color: Color.fromARGB(255, 25, 1, 92),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Prompt',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Column(
                            children: [
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          PaymentScreen.routeName,
                                          arguments:
                                              CustomerArgument(editCust: false, hargaCoupon: '0.6'),
                                        );
                                      },
                                      child: couponType(
                                        Color.fromARGB(255, 201, 184, 248),
                                        'assets/images/1-hour.svg',
                                        'Hourly',
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          PaymentScreen.routeName,
                                          arguments:
                                              CustomerArgument(editCust: false, hargaCoupon: '4.0'),
                                        );
                                      },
                                      child: couponType(
                                        Color.fromARGB(255, 201, 184, 248),
                                        'assets/images/24-hours.svg',
                                        'Daily',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          PaymentScreen.routeName,
                                          arguments:
                                              CustomerArgument(editCust: false, hargaCoupon: '20.0'),
                                        );
                                      },
                                      child: couponType(
                                        Color.fromARGB(255, 201, 184, 248),
                                        'assets/images/7-days.svg',
                                        'Weekly',
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          PaymentScreen.routeName,
                                          arguments:
                                              CustomerArgument(editCust: false, hargaCoupon: '50.0'),
                                        );
                                      },
                                      child: couponType(
                                        Color.fromARGB(255, 201, 184, 248),
                                        'assets/images/calendar.svg',
                                        'Monthly',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          PaymentScreen.routeName,
                                          arguments:
                                              CustomerArgument(editCust: false, hargaCoupon: '999.0'),
                                        );
                                      },
                                      child: couponType(
                                        Color.fromARGB(255, 201, 184, 248),
                                        'assets/images/credit.svg',
                                        'Credit',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  child: Stack(
                    children: [
                      Container(
                        width: 330,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 153, 115, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 240,
                        child: Column(
                          // width: 65,
                          // height: 65,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _topUpBottomSheet(context);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                primary: Color.fromARGB(
                                    255, 33, 44, 243), // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            const Text(
                              'Topup',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Prompt',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        right: 170,
                        child: Text(
                          'CREDIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 70,
                        right: 140,
                        child: Text(
                          'RM 100',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: 'Prompt',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 7,
                  left: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(dailysaleRoute);
                    },
                    style: ButtonStyle(
                      // foregroundColor:
                      //     MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 153, 115, 255),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 50,
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Daily Sales",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,

                          //fontFamily: 'Prompt',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //
  }

  Card couponType(color, _icons, _text) {
    return Card(
      elevation: 0,
      child: Container(
        width: 160,
        height: 110,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 4),
              child: SvgPicture.asset(
                _icons,
                height: 70,
                width: 70,
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(
              '$_text',
              style: const TextStyle(
//                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
                //fontFamily: 'Prompt',
              ),
            )
          ],
        ),
      ),
    );
  }

  _topUpBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 129, 6, 150),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.63,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(30.0, 10, 30, 0),
                      child: TextFormField(
                        controller: _controller,
                        maxLength: 4,
                        autofocus: false,
                        focusNode: focusNode1,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        style: TextStyle(fontSize: 25.0),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))
                        ],
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: clearText, icon: Icon(Icons.clear)),
                          //border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          //errorBorder: InputBorder.none,
                          //disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Enter your prefered amount",
                          hintStyle: TextStyle(fontSize: 18),
                          helperText: 'Min reload amount is RM10',
                          helperStyle: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 0.00),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              hargaReload('100'),
                              hargaReload('200'),
                            ],
                          ),
                          Row(
                            children: [
                              hargaReload('300'),
                              hargaReload('500'),
                            ],
                          ),
                          Row(
                            children: [
                              hargaReload('1000'),
                              otherReload(),
                            ],
                          ),
                          reloadButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: 2,
                child: Text(
                  "Reload",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                    fontSize: 35,
                    //fontFamily: 'Prompt',
                  ),
                ),
              ),
            ],
          );
        });
  }

  otherReload() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10.0, 20),
      child: ElevatedButton(
        onPressed: () {
          focusNode1.requestFocus();
        },
        style: ButtonStyle(
          // foregroundColor:
          //     MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 209, 197, 241),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          width: 106,
          height: 55,
          //padding: const EdgeInsets.all(0),
          child: const Text(
            "Other",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
              //fontFamily: 'Prompt',
            ),
          ),
        ),
      ),
    );
  }

  void onButtonPressed(harga_) {
    _controller.text = harga_;
  }

  hargaReload(price) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10.0, 20),
      child: ElevatedButton(
        onPressed: () {
          onButtonPressed(price);
        },
        style: ButtonStyle(
          // foregroundColor:
          //     MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 209, 197, 241),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          width: 106,
          height: 55,
          //padding: const EdgeInsets.all(0),
          child: Text(
            "RM$price",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
              //fontFamily: 'Prompt',
            ),
          ),
        ),
      ),
    );
  }

  reloadButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10.0, 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          // foregroundColor:
          //     MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 69, 11, 228),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 55,
          //padding: const EdgeInsets.all(0),
          child: const Text(
            "Reload e-Wallet",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,

              //fontFamily: 'Prompt',
            ),
          ),
        ),
      ),
    );
  }

  void clearText() {
    _controller.clear();
  }
}
