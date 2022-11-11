import 'package:evocoupon/Service.dart';
import 'package:evocoupon/core/app_export.dart';
//import 'package:evocoupon/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:evocoupon/core/constants/routes.dart';
import 'package:flutter/services.dart';
import '../../core/constants/constants.dart';
import 'package:evocoupon/view/Payment/payment_screen.dart';

import '../../size_config.dart';
import '../CustomerCreateUpdateScreen.dart';
import '../ScreenRoute.dart';
import 'package:evocoupon/providers/usuario_provider.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController txtCorreo = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  //static late MediaQueryData _mediaQueryData ;
  @override
  Widget build(BuildContext context) {
    //alert fx
    _onAlertButtonPressed(context) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "ERROR!",
        desc: "Wrong email or password!",
        buttons: [
          DialogButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
    //end alert fx

    final usuarioProvider = Provider.of<Usuario_provider>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.deepPurple50,
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              margin: getMargin(
                top: 57,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: double.infinity,
                      margin: getMargin(
                        left: 18,
                        right: 18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: getPadding(
                              bottom: 3,
                            ),
                            child: CommonImageView(
                              imagePath: ImageConstant.imgImage1,
                              height: getSize(
                                60.00,
                              ),
                              width: getSize(
                                60.00,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 20,
                              top: 23,
                            ),
                            child: Text(
                              "EVOCoupon",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  40,
                                ),
                                fontFamily: 'Prompt',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: getHorizontalSize(
                              221.00,
                            ),
                            margin: getMargin(
                              left: 18,
                              right: 18,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'By signing in you are agreeing our ',
                                    style: TextStyle(
                                      color: ColorConstant.gray700,
                                      fontSize: getFontSize(
                                        20,
                                      ),
                                      fontFamily: 'Prompt',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Term and privacy policy',
                                    style: TextStyle(
                                      color: ColorConstant.lightBlue700,
                                      fontSize: getFontSize(
                                        20,
                                      ),
                                      fontFamily: 'Prompt',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // CustomTextFormField(
                        //   width: 337,
                        //   focusNode: FocusNode(),
                        //   hintText: "User ID",
                        //   margin: getMargin(
                        //     left: 18,
                        //     top: 35,
                        //     right: 18,
                        //   ),
                        //   alignment: Alignment.center,
                        //   suffix: Container(
                        //     margin: getMargin(
                        //       left: 30,
                        //       top: 24,
                        //       right: 24,
                        //       bottom: 23,
                        //     ),
                        //     child: CommonImageView(
                        //       svgPath: ImageConstant.imgMail,
                        //     ),
                        //   ),
                        //   suffixConstraints: BoxConstraints(
                        //     minWidth: getHorizontalSize(
                        //       20.00,
                        //     ),
                        //     minHeight: getVerticalSize(
                        //       16.00,
                        //     ),
                        //   ),
                        // ),
                        // CustomTextFormField(
                        //   width: 337,
                        //   focusNode: FocusNode(),
                        //   hintText: "Password",
                        //   margin: getMargin(
                        //     left: 18,
                        //     top: 51,
                        //     right: 18,
                        //   ),
                        //   textInputAction: TextInputAction.done,
                        //   alignment: Alignment.center,
                        //   suffix: Container(
                        //     margin: getMargin(
                        //       left: 30,
                        //       top: 14,
                        //       right: 23,
                        //       bottom: 29,
                        //     ),
                        //     child: CommonImageView(
                        //       svgPath: ImageConstant.imgLock,
                        //     ),
                        //   ),
                        //   suffixConstraints: BoxConstraints(
                        //     minWidth: getHorizontalSize(
                        //       18.00,
                        //     ),
                        //     minHeight: getVerticalSize(
                        //       20.00,
                        //     ),
                        //   ),
                        //   isObscureText: true,
                        // ),
                        Container(
                          height: SizeConfig.screenHeight * 0.04,
                        ),
                        Center(
                          child: SizedBox(
                              width: SizeConfig.screenWidth * 0.85,
                              child: Form(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        autofocus: true,
                                        controller: txtCorreo,
                                        onChanged: (value) =>
                                            usuarioProvider.email = value,
                                        validator: (value) {
                                          String pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regExp = new RegExp(pattern);
                                          return regExp.hasMatch(value ?? '')
                                              ? null
                                              : 'Please enter a valid email address';
                                        },
                                        //cursorColor: Colors.redAccent,
                                        decoration: InputDecoration(
                                          filled: true, //<-- SEE HERE
                                          fillColor: Color.fromARGB(
                                              255, 255, 255, 255),
                                          hintText: 'User ID',
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
                                    ],
                                  ))),
                        ),
                        Container(
                          height: SizeConfig.screenHeight * 0.04,
                        ),
                        Center(
                          child: SizedBox(
                              width: SizeConfig.screenWidth * 0.85,
                              child: Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(children: [
                                  TextFormField(
                                    autofocus: true,
                                    controller: txtPassword,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    validator: (value) {
                                      return (value != null &&
                                              value.length >= 6)
                                          ? null
                                          : 'Password must be long than 6 character';
                                    },
                                    //cursorColor: Colors.redAccent,
                                    decoration: InputDecoration(
                                      filled: true, //<-- SEE HERE
                                      fillColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      hintText: 'Password',
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
                                ]),
                              )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: getPadding(
                              left: 195,
                              top: 32,
                              right: 9,
                            ),
                            child: GestureDetector(
                              child: Text(
                                "Forget password",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.lightBlue700,
                                  fontSize: getFontSize(
                                    21,
                                  ),
                                  fontFamily: 'Prompt',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                                var usuarios = usuarioProvider.usuarios;

                                if (usuarios
                                            .where((e) =>
                                                e.email == txtCorreo.text)
                                            .length >
                                        0 &&
                                    usuarios
                                            .where((e) =>
                                                e.password == txtPassword.text)
                                            .length >
                                        0) {
                                  Navigator.of(context).pushNamed(homeRoute);
                                } else {
                                  _onAlertButtonPressed(context);
                                }
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
                                  "LOGIN",
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
