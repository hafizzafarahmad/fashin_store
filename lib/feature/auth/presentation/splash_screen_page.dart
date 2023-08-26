import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/style/app_asset.dart';
import '../../../core/style/app_size.dart';
import '../controller/auth_controller.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);


  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(),
      builder: (AuthController controller){
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Image.asset(
              AppAsset.logo,
              fit: BoxFit.cover,
              width: AppSize.width(context, size: 0.6),
            ),
          ),
        );
      },
    );
  }

}