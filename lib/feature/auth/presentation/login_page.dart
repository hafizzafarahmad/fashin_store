import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_size.dart';
import 'package:fashion_store/feature/auth/controller/auth_controller.dart';
import 'package:fashion_store/feature/home/presentation/dashboard.dart';

import '../../../core/widget/button_widget.dart';
import '../../../core/widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
        return Scaffold(
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                height: AppSize.height(context, size: 1),
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 25.0, bottom: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo.png", width: AppSize.width(context, size: 0.5),),
                    const Padding(
                      padding: EdgeInsets.only(top: 35.0, bottom: 16),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sign in",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              )

                          )),
                    ),
                    CustomTextField(
                      hintText: 'Username',
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      obscureText: true,
                      isPassword: true,
                      hintText: 'Password',
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 30,),

                    SizedBox(
                      width: double.infinity,
                      child: ButtonWidget.submit(
                          text: "Login",
                          fontSize: 16,
                          onPress: (){
                            Get.offAll(const Dashboard());
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
