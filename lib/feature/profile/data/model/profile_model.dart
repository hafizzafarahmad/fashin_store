import 'dart:math';

import 'package:fashion_store/core/style/app_asset.dart';

///Model data product from Local or API
///if using API you can add variable status, code, message etc. here
class ProfileModel{
  ProfileData? data;

  ///Data Dummy
  static ProfileData dummyData() {
    return ProfileData(
      id: Random().nextInt(10000),
      name: 'Liam Alexander Hayes',
      email: 'liam.alexander.hayes@email.com',
      phone: '5551234567',
      photo: AppAsset.profile,
      wallet: 400,
      point: 2000,
      coupon: 14
    );
  }
}

///Model data for profile
class ProfileData{
  int id;
  String name;
  String phone;
  String email;
  String photo;
  int wallet;
  int point;
  int coupon;

  ProfileData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.photo,
    required this.wallet,
    required this.point,
    required this.coupon,
  });
}