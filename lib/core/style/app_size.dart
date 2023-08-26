import 'package:flutter/material.dart';

///Use this class for dynamic sizing
class AppSize{
  AppSize._();

  ///The size is based on the width of the screen
  ///{:size} = 0.1 - 1
  static double width(BuildContext context, {required double size}){
    var sized = MediaQuery.of(context).size.width * size;
    return sized;
  }

  ///The size is based on the height of the screen
  ///{:size} = 0.1 - 1
  static double height(BuildContext context, {required double size}){
    var sized = MediaQuery.of(context).size.height * size;
    return sized;
  }
}

