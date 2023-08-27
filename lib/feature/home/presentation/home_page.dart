import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/widget/button_widget.dart';
import 'package:fashion_store/feature/product/presentation/detail_product_page.dart';

import '../../../core/style/app_asset.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_size.dart';
import '../../product/presentation/all_brand_page.dart';
import '../../product/presentation/cart_page.dart';
import '../../product/presentation/new_arrival_page.dart';
import '../../product/presentation/new_collection_page.dart';
import '../../product/presentation/product_page.dart';
import '../../product/presentation/widget/item_product_widget.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller){
        return GetBuilder(
          init: HomeController(),
          builder: (HomeController controller){
            return Scaffold(
              body: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: AppSize.height(context, size: 0.06),),
                    ///Top Bar
                    Row(
                      children: [
                        ///Search Field
                        Expanded(
                          flex: 10,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(const ProductPage(isFormHomePage: true,));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              width: AppSize.width(context, size: 0.82),
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: AppColor.greyishContainer2,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search_outlined,
                                    size: 18.0,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "What are you looking for?",
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        ///Chart
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: (){
                              Get.to(const CartPage());
                            },
                            child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.black,
                                )),
                          ),
                        )
                      ],
                    ),

                    ///BANNER
                    Container(
                      height: AppSize.height(context, size: 0.25),
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8.0,
                              spreadRadius: 1 ,
                              offset: Offset(5.0, 10.0)
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('New Collection',
                                  style: TextStyle(color: Colors.white,
                                      fontSize: AppSize.width(context, size: 0.045),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('Discount 50% for the first transaction',
                                  style: TextStyle(color: Colors.white,
                                    fontSize: AppSize.width(context, size: 0.03),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                ButtonWidget.submit(
                                  onPress: (){
                                    Get.to(const NewCollectionPage());
                                  },
                                  text: 'Shop Now',
                                  fontSize: 11
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(AppAsset.bannerHome, fit: BoxFit.fitWidth,),
                          )
                        ],
                      ),
                    ),

                    ///Brand
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Brand',
                            style: TextStyle(color: Colors.black,
                                fontSize: AppSize.width(context, size: 0.032),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const AllBrandPage());
                            },
                            child: Text('See All',
                              style: TextStyle(color: AppColor.mainColor,
                                fontSize: AppSize.width(context, size: 0.032),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, childAspectRatio: 1),
                      itemCount: controller.listBrand.length,
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
                            controller.listBrand[index].path ?? '',
                            fit: BoxFit.cover,
                            width: AppSize.width(context, size: 0.12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),

                    ///New Arrival
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('New Arrival',
                            style: TextStyle(color: Colors.black,
                                fontSize: AppSize.width(context, size: 0.032),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const NewArrivalPage());
                            },
                            child:Text('See All',
                              style: TextStyle(color: AppColor.mainColor,
                                fontSize: AppSize.width(context, size: 0.032),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.1, crossAxisSpacing: 15),
                      itemCount: controller.listProduct.length,
                      itemBuilder: (_, index) => ItemProductWidget(
                        data: controller.listProduct[index],
                      ),
                    ),

                    const SizedBox(height: 100,)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}