import 'package:fashion_store/feature/product/presentation/widget/item_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_size.dart';
import 'package:fashion_store/core/widget/button_widget.dart';
import 'package:fashion_store/feature/product/controller/product_controller.dart';

import '../../../core/widget/custom_textfield.dart';
import 'detail_product_page.dart';

class NewCollectionPage extends StatefulWidget {
  const NewCollectionPage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<NewCollectionPage> {

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
          'New Collection',
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
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.1, crossAxisSpacing: 15),
                    itemCount: controller.product.length,
                    itemBuilder: (_, index) => ItemProductWidget(
                      data: controller.product[index],
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