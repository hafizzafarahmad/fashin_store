import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_store/feature/home/data/model/brand_model.dart';
import 'package:fashion_store/feature/product/data/model/product_model.dart';
import 'package:fashion_store/feature/profile/data/model/profile_model.dart';

class ProfileController extends GetxController {

  ProfileData? profileData;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile(){
    profileData = ProfileModel.dummyData();
    update();
  }
}
