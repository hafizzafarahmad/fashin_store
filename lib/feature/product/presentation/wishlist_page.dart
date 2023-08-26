import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_size.dart';
import 'package:fashion_store/core/widget/button_widget.dart';
import 'package:fashion_store/feature/product/controller/product_controller.dart';



class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<WishListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wishlist',
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
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///List Wishlist
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      addAutomaticKeepAlives: true,
                      itemCount: controller.wishList.length,
                      itemBuilder: (context, i){
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      controller.wishList[i].image?.first ?? '',
                                      fit: BoxFit.fitWidth,
                                      width: AppSize.width(context, size: 0.2),
                                      height: AppSize.width(context, size: 0.2),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.wishList[i].name,
                                        style: TextStyle(
                                            fontSize: AppSize.width(context, size: 0.028),
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        controller.wishList[i].size?.first ?? '-',
                                        style: TextStyle(
                                          fontSize: AppSize.width(context, size: 0.025),
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text(
                                            '\$${controller.wishList[i].price}',
                                            style: TextStyle(
                                                fontSize: AppSize.width(context, size: 0.028),
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Icon(Icons.delete, size: 20, color: Colors.black38),

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
    );
  }

}