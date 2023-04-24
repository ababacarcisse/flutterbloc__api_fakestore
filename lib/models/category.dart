import 'dart:convert';

class Category {

  final int id;
  final String name;

  Category( {
   required this.id, required this.name,
  });


  
      Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
     
    };
  }
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
     
    );
  }
}List<Category> categorieFromJson(String str) => List<String>.from(jsonDecode(str))
    .map((name,) => Category(name: name,id: 0 ,))
    .toList();



 // List<Category> categorieFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));
String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));