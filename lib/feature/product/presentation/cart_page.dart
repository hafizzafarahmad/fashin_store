import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_size.dart';
import 'package:fashion_store/core/widget/button_widget.dart';
import 'package:fashion_store/feature/product/controller/product_controller.dart';

import '../../../core/style/app_color.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<CartPage> {

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
          'Cart',
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
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///List Cart
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      addAutomaticKeepAlives: true,
                      itemCount: controller.cart.length,
                      itemBuilder: (context, i){
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                value: controller.selectedCart.firstWhereOrNull((element) => element.id == controller.cart[i].id) != null,
                                activeColor: AppColor.mainColor,
                                onChanged: (bool? value) {
                                  controller.onCheckedCart(controller.cart[i]);
                                },
                              ),
                              const SizedBox(width: 10,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  controller.cart[i].image?.first ?? '',
                                  fit: BoxFit.fitWidth,
                                  width: AppSize.width(context, size: 0.2),
                                  height: AppSize.width(context, size: 0.2),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.cart[i].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: AppSize.width(context, size: 0.028),
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      controller.cart[i].size?.first ?? '-',
                                      style: TextStyle(
                                        fontSize: AppSize.width(context, size: 0.025),
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Text(
                                          '\$${controller.cart[i].price}',
                                          style: TextStyle(
                                              fontSize: AppSize.width(context, size: 0.028),
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),

                ],
              ),
            ),
          );
        },
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ButtonWidget.submit(text: 'Checkout'),
        )
    );
  }

}