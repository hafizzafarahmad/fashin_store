import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_color.dart';
import 'package:fashion_store/feature/auth/presentation/login_page.dart';
import 'package:fashion_store/feature/profile/controller/profile_controller.dart';

import '../../../core/style/app_size.dart';
import 'edit_address_page.dart';
import 'edit_payment_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Profile',
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
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Profile Data
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              controller.profileData?.photo ?? '',
                              fit: BoxFit.fitWidth,
                              width: AppSize.width(context, size: 0.15),
                              height: AppSize.width(context, size: 0.15),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.profileData?.name ?? '-',
                                style: TextStyle(
                                    fontSize: AppSize.width(context, size: 0.033),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                controller.profileData?.phone ?? '-',
                                style: TextStyle(
                                  fontSize: AppSize.width(context, size: 0.025),
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.profileData?.email ?? '-',
                                    style: TextStyle(
                                      fontSize: AppSize.width(context, size: 0.025),
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(const EditProfilePage());
                        },
                        child:  const Icon(FontAwesomeIcons.pencil, size: 20, color: Colors.black54),
                      )


                    ],
                  ),

                  ///Wallet and Points
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2.0,
                            spreadRadius: 1,
                            offset:
                            Offset(0.0, 1.0))
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.wallet,
                                    size: AppSize.width(context,
                                        size: 0.04),
                                    color: AppColor.mainColor,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '\$${controller.profileData?.wallet ?? '0'}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppSize.width(
                                            context,
                                            size: 0.03),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Store Wallet',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: AppSize.width(context, size: 0.025),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.coins,
                                    size: AppSize.width(context,
                                        size: 0.04),
                                    color: Colors.orangeAccent,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${controller.profileData?.point ?? '0'} Coins',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppSize.width(
                                            context,
                                            size: 0.03),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Reward',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: AppSize.width(context, size: 0.025),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.ticket,
                                    size: AppSize.width(context,
                                        size: 0.04),
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${controller.profileData?.coupon ?? '0'} Coupon',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppSize.width(
                                            context,
                                            size: 0.03),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Discount',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: AppSize.width(context, size: 0.025),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///Account Setting
                  Text(
                    'Account Setting',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSize.width(context, size: 0.033),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ///Address
                  GestureDetector(
                    onTap: (){
                      Get.to(const EditAddressPage());
                    },
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.house,
                          color: Colors.black,
                          size: AppSize.width(context, size: 0.035),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: AppSize.width(context, size: 0.03),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              'Change the shipping address',
                              style: TextStyle(
                                  fontSize: AppSize.width(context, size: 0.025),
                                  color: Colors.black54
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  const Divider(thickness: 1,),
                  ///bank account
                  GestureDetector(
                    onTap: (){
                      Get.to(const EditPaymentPage());
                    },
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.moneyBills,
                          color: Colors.black,
                          size: AppSize.width(context, size: 0.035),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment',
                              style: TextStyle(
                                  fontSize: AppSize.width(context, size: 0.03),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              'E-wallet & Credit Card',
                              style: TextStyle(
                                  fontSize: AppSize.width(context, size: 0.025),
                                  color: Colors.black54
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 1,),
                  ///Log Out
                  GestureDetector(
                    onTap: (){
                      Get.offAll(const LoginPage());
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout_rounded,
                          color: Colors.black,
                          size: AppSize.width(context, size: 0.038),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: AppSize.width(context, size: 0.03),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              'Logout & Back to Login Page',
                              style: TextStyle(
                                  fontSize: AppSize.width(context, size: 0.025),
                                  color: Colors.black54
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 1,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}