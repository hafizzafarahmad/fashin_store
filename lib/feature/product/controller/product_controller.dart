import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/feature/home/data/model/brand_model.dart';
import 'package:fashion_store/feature/product/data/model/product_model.dart';

class ProductController extends GetxController {
  final bool isFormHomePage;

  ProductController(
      {this.isFormHomePage = false,});

  int selectedImage = 0;
  int selectedSize = 0;
  List<ProductData> cart = [];
  List<ProductData> selectedCart = [];
  List<ProductData> product = [];
  List<BrandData> brand = [];

  List<ProductData> wishList = [];

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void onInit() {
    if(isFormHomePage){
      ///focus to specific TextField
      searchFocusNode.requestFocus();
    }
    super.onInit();
    getCart();
    getWishList();
    getProduct();
    getBrand();
  }

  getBrand(){
    brand = BrandModel.dummyData();
    update();
  }

  getProduct(){
    product = ProductModel.dummyData();
    update();
  }

  getCart(){
    if(cart.isEmpty){
      cart = ProductModel.dummyData();
    }
    update();
  }

  getWishList(){
    if(wishList.isEmpty){
      wishList = ProductModel.dummyData();
    }
    update();
  }

  onCheckedCart(ProductData data){
    ///Check selectedCart to prevent duplicate data
    if(selectedCart.firstWhereOrNull((element) => element.id == data.id) == null){
      selectedCart.add(data);
    } else {
      selectedCart.remove(data);
    }
    update();
  }

  onSelectedImage(int index){
    selectedImage = index;
    update();
  }

  onSelectedSize(int index){
    selectedSize = index;
    update();
  }

}
