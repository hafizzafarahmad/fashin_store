import 'dart:math';

///Model data product from Local or API
///if using API you can add variable status, code, message etc. here
class ProductModel{
  List<ProductData> list = [];

  ///Data Dummy
  static List<ProductData> dummyData() {
    return [
      ProductData(
        id: Random().nextInt(100000),
        name: 'Nike Court Vision Low',
        category: 'Women\'s Shoes',
        price: 89.21,
        description: 'It has an upper inspired by old-school hoops sneakers and the classic rubber cupsole featured on some of the most iconic silhouettes of the past.',
        rating: 4.5,
        quantity: 1,
        size: [
          'EU 39',
          'EU 40',
          'EU 41',
          'EU 42'
        ],
        image: [
          'assets/product/Nike Court1.png',
          'assets/product/Nike Court2.png'
        ],
      ),
      ProductData(
        id: Random().nextInt(100000),
        name: 'Nike Dunk Low Retro',
        category: 'Men\'s Shoes',
        price: 89.21,
        description: 'It has an upper inspired by old-school hoops sneakers and the classic rubber cupsole featured on some of the most iconic silhouettes of the past.',
        rating: 4.5,
        quantity: 1,
        size: [
          'EU 39',
          'EU 40',
          'EU 41',
          'EU 42'
        ],
        image: [
          'assets/product/Nike Dunk1.png',
          'assets/product/Nike Dunk2.png'
        ],
      )
    ];
  }
}

///Model data for each product
class ProductData{
  int id;
  String name;
  String category;
  double price;
  String? description;
  double? rating;
  int quantity;
  List<String>? size;
  List<String>? image;

  ProductData({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.rating,
    required this.size,
    required this.image,
    required this.quantity,
  });
}