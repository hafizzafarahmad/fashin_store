import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/route/app_route.dart';
import 'core/route/route_constant.dart';
import 'core/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fashion Store',
      theme: AppTheme.main,
      getPages: AppRoute.all,
      initialRoute: RouteConstant.splash,
      debugShowCheckedModeBanner: false,
      defaultTransition: Platform.isIOS ? Transition.native : Transition.rightToLeftWithFade,
      transitionDuration: Platform.isIOS ? null : const Duration(milliseconds: 300),
    );
  }
}
