import 'package:flutter/rendering.dart';

class AppShadow {
  //TODO: shadow effect
  static List<BoxShadow> primary = [
    const BoxShadow(
        color:  Color(0x15000000),
        offset: Offset(0, 2),
        blurRadius: 3,
        spreadRadius: 1),
  ];
}
