import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/widget/button_widget.dart';
import 'package:fashion_store/feature/profile/controller/profile_controller.dart';

import '../../../core/widget/custom_textfield.dart';

class EditPaymentPage extends StatefulWidget {
  const EditPaymentPage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<EditPaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Payment',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        init: ProfileController(),
        builder: (ProfileController controller){
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Bank/E-Wallet
                  CustomTextField(
                    hintText: 'Bank/E-Wallet',
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 15,),
                  ///Bank/E-Wallet Number
                  CustomTextField(
                    hintText: 'Bank/E-Wallet Number',
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 15,),
                  ///Billing Address
                  CustomTextField(
                    hintText: 'Billing Address',
                    maxLength: 3,
                    textInputType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonWidget.submit(text: 'Save'),
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }

}