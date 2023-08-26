import '../../../../core/style/app_asset.dart';

///Model data product from Local or API
///if using API you can add variable status, code, message etc. here
class BrandModel{
  List<BrandData> list = [];

  ///Data Dummy
  static List<BrandData> dummyData() {
    return [
      BrandData(id: '1',
          name: 'Adidas',
          path: AppAsset.adidas),
      BrandData(id: '2',
          name: 'Nike',
          path: AppAsset.nike),
      BrandData(id: '3',
          name: 'Reebok',
          path: AppAsset.reebok),
      BrandData(id: '4',
          name: 'Puma',
          path: AppAsset.puma),
    ];
  }
}

///Model data for each product
class BrandData{
  String? id;
  String? name;
  String? path;

  BrandData({this.id, this.name, this.path});
}