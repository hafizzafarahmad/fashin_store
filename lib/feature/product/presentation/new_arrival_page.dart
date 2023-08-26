import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_size.dart';
import 'package:fashion_store/core/widget/button_widget.dart';
import 'package:fashion_store/feature/product/controller/product_controller.dart';

import '../../../core/widget/custom_textfield.dart';
import 'detail_product_page.dart';

class NewArrivalPage extends StatefulWidget {
  const NewArrivalPage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<NewArrivalPage> {

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
          'New Arrival',
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
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        ///Navigate to Product Detail
                        Get.to(DetailProductPage(data: controller.product[index]));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    controller.product[index].image?.first ?? '',
                                    fit: BoxFit.fitWidth,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: FaIcon(
                                    FontAwesomeIcons.heart,
                                    size: AppSize.width(context, size: 0.045),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.product[index].name,
                                        style: TextStyle(
                                            fontSize: AppSize.width(context, size: 0.024),
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star, size: 13, color: Colors.orangeAccent,),
                                          Text(
                                            '${controller.product[index].rating}',
                                            style: TextStyle(
                                              fontSize: AppSize.width(context, size: 0.023),
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.product[index].price}',
                                    style: TextStyle(
                                        fontSize: AppSize.width(context, size: 0.024),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )

                        ],
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