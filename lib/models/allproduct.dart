import 'dart:convert';

  List<AllProduct> allproductFromJson(String str) => List<AllProduct>.from(json.decode(str).map((x) => AllProduct.fromJson(x)));
String allproductToJson(List<AllProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class AllProduct {

  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
//le constructeur pour initialiser les propriétés et la méthode fromJson pour convertir un objet JSON en objet AllProduct
  AllProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
  int get categoryId => category.toLowerCase().hashCode;


  
      Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }
  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
