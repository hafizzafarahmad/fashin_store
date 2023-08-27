import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature/auth/presentation/login_page.dart';
import '../../feature/auth/presentation/splash_screen_page.dart';
import '../../feature/home/presentation/dashboard.dart';
import '../../feature/home/presentation/home_page.dart';
import 'route_constant.dart';


class AppRoute {
  static final List<GetPage> all = [
    //TODO: Register your screen in here
    GetPage(name: RouteConstant.splash, page: () => const SplashScreenPage(),),
    GetPage(name: RouteConstant.home, page: () => const HomePage(),),
    GetPage(name: RouteConstant.dashboard, page: () => const Dashboard(),),
    GetPage(name: RouteConstant.login, page: () => const LoginPage(),),
    // GetPage(name: RouteConstant.promo, page: () => const PromoPage(),),
    // GetPage(name: RouteConstant.promoDetail, page: () => const PromoDetailPage(),),
  ];
}
