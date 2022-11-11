import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color deepPurple50 = fromHex('#eae2fa');

  static Color gray700 = fromHex('#6b5e5e');

  static Color gray400 = fromHex('#c4c4c4');

  static Color black900 = fromHex('#000000');

  static Color lightBlue700 = fromHex('#0386d0');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90035 = fromHex('#35000000');

  static Color whiteA7009b = fromHex('#9bffffff');

  static Color lightBlue800 = fromHex('#036bb9');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
