import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_size.dart';
import 'package:fashion_store/feature/product/controller/product_controller.dart';

import '../../../core/style/app_color.dart';

class AllBrandPage extends StatefulWidget {
  const AllBrandPage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<AllBrandPage> {

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
          'All Brand',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        init: ProductController(),
        builder: (ProductController controller){
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///List Wishlist
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1),
                    itemCount: controller.brand.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColor.greyishContainer2,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          controller.brand[index].path ?? '',
                          fit: BoxFit.cover,
                          width: AppSize.width(context, size: 0.12),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

}