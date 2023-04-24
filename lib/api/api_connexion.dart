import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/allproduct.dart';

//Cette fonction fetchProducts utilise la méthode get de la bibliothèque
// http pour effectuer une requête GET à l'API FakeStore. Si la réponse est
//un code de statut 200 OK, la fonction décode le corps de la réponse en
//utilisant json.decode et utilise la méthodee map pour convertir chaque
// entrée JSON en un objet AllProduct
// à l'aide de la méthode fromJson. Le résultat final est une liste de produits.
Future<List<AllProduct>> fetchProducts([String? categories]) async {
  final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));

  if (response.statusCode == 200) {
    List<dynamic> productsJson = json.decode(response.body);
    return productsJson.map((product) => AllProduct.fromJson(product)).toList();
  } else {
    //Si la réponse n'est pas un code de statut 200 OK, la fonction lance une exception avec le message Failed to load products.
    throw Exception('Failed to load products');
  }
}
