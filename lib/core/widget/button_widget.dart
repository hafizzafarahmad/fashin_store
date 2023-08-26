import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';

//All buttons of this app are customized here
class ButtonWidget{
  ButtonWidget._();

  static Widget light({VoidCallback? onPress, required String text, double? fontSize, Color? color}){
    return ElevatedButton(
      onPressed: onPress ?? (){},
      style: ElevatedButton.styleFrom(
        side:  BorderSide(width: 1, color: color == null ? AppColor.mainColor : Colors.white,),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20),)
        ),
        backgroundColor: color ?? Colors.white,
        shadowColor: Colors.white,
      ),
      child: Text(text,
        style: TextStyle(
            color: color == null ? AppColor.mainColor : Colors.white,
            fontSize: fontSize ?? 13
        ),
      ),
    );
  }

  static Widget submit({VoidCallback? onPress, required String text, double? fontSize}){
    return ElevatedButton(
      onPressed: onPress ?? (){},
      style: ElevatedButton.styleFrom(
        side:  const BorderSide(width: 2, color: AppColor.mainColor,),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20),)
        ),
        backgroundColor:  AppColor.mainColor,
        shadowColor: Colors.white,
      ),
      child: Text(text,
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 13
        ),
      ),
    );
  }
}

