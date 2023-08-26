import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/core/style/app_color.dart';
import 'package:fashion_store/core/style/app_size.dart';
import 'package:fashion_store/core/widget/button_widget.dart';
import 'package:fashion_store/feature/product/controller/product_controller.dart';
import 'package:fashion_store/feature/product/data/model/product_model.dart';


class DetailProductPage extends StatefulWidget {
  final ProductData data;
  const DetailProductPage({Key? key, required this.data}) : super(key: key);


  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<DetailProductPage> {

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
          'Product Detail',
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Product Image
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: AppSize.height(context, size: 0.45),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.data.image?[controller.selectedImage] ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  ///List Product Image
                  Container(
                    alignment: Alignment.center,
                    height: AppSize.width(context, size: 0.13),
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        addAutomaticKeepAlives: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.data.image?.length,
                        itemBuilder: (context, i){
                          return GestureDetector(
                            onTap: (){
                              controller.onSelectedImage(i);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: AppSize.width(context, size: 0.13),
                              decoration: BoxDecoration(
                                  border: controller.selectedImage == i ? Border.all(color: AppColor.mainColor, width: 2) : null,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  widget.data.image?[i] ?? '',
                                  fit: BoxFit.fitWidth,
                                  width: AppSize.width(context, size: 0.1),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  const SizedBox(height: 20,),

                  ///Detail
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data.category,
                        style: TextStyle(
                            fontSize: AppSize.width(context, size: 0.028),
                            color: Colors.black54,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 15, color: Colors.orangeAccent,),
                          Text(
                            '${widget.data.rating}',
                            style: TextStyle(
                              fontSize: AppSize.width(context, size: 0.028),
                              color: Colors.black54,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    widget.data.name,
                    style: TextStyle(
                      fontSize: AppSize.width(context, size: 0.035),
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '\$${widget.data.price}',
                    style: TextStyle(
                        fontSize: AppSize.width(context, size: 0.035),
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 5,),

                  const Divider(thickness: 1,),
                  const SizedBox(height: 5,),

                  ///Size
                  Text(
                    'Select Size',
                    style: TextStyle(
                        fontSize: AppSize.width(context, size: 0.030),
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: AppSize.width(context, size: 0.06),
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        addAutomaticKeepAlives: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.data.size?.length,
                        itemBuilder: (context, i){
                          return GestureDetector(
                            onTap: (){
                              controller.onSelectedSize(i);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 10),
                              width: AppSize.width(context, size: 0.13),
                              decoration: BoxDecoration(
                                  color: controller.selectedSize == i ? AppColor.mainColor : Colors.transparent ,
                                  border: controller.selectedSize == i ?
                                  Border.all(color: AppColor.mainColor, width: 1) :
                                  Border.all(color: AppColor.greyishContainer2, width: 1),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Text(
                                widget.data.size?[i] ?? '',
                                style: TextStyle(
                                    fontSize: AppSize.width(context, size: 0.030),
                                    color: controller.selectedSize == i ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  const SizedBox(height: 10,),

                  ///Description
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: AppSize.width(context, size: 0.030),
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    widget.data.description ?? '-',
                    style: TextStyle(
                        fontSize: AppSize.width(context, size: 0.028),
                        color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50,),

                ],
              ),
            ),
          );
        },
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ButtonWidget.submit(text: 'BUY NOW'),
        )
    );
  }

}