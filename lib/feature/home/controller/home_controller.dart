import 'package:get/get.dart';
import 'package:fashion_store/feature/home/data/model/brand_model.dart';
import 'package:fashion_store/feature/product/data/model/product_model.dart';

class HomeController extends GetxController {

  List<BrandData> listBrand = [];
  List<ProductData> listProduct = [];

  @override
  void onInit() {
    super.onInit();
    ///Get data when opening the home page for the first time
    getBrand();
    getProduct();
  }

  getBrand(){
    if(listBrand.isEmpty){
      listBrand = BrandModel.dummyData();
    }
    update();
  }

  getProduct(){
    if(listProduct.isEmpty){
      listProduct = ProductModel.dummyData();
    }
    update();
  }

}
