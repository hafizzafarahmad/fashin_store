import 'package:fashion_store/feature/product/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_size.dart';
import '../detail_product_page.dart';

class ItemProductWidget extends StatelessWidget{
  final ProductData data;

  const ItemProductWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ///Navigate to Product Detail
        Get.to(DetailProductPage(data: data));
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
                    data.image?.first ?? '',
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
                      Expanded(
                        child: Text(
                          data.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppSize.width(context, size: 0.024),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 13, color: Colors.orangeAccent,),
                          Text(
                            '${data.rating}',
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
                    '\$${data.price}',
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
    );
  }

}