import 'package:ecommerce_app/models/allproduct.dart';

class Product extends AllProduct {
  Product({
    required int id,
    required String title,
    required double price,
    required String category,
    required String description,
    required String image,
  }) : super(
          id: id,
          title: title,
          price: price,
          category: category,
          description: description,
          image: image,
        );
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
    );
  }
}
