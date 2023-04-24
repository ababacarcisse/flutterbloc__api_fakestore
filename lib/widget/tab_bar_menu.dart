import '../models/allproduct.dart';
import '../models/tapbar_buttonModel.dart';
import 'package:http/http.dart' as http;

int selectedTabIndex = 0;































List<TapBarModel> tabBarMenu = [
  TapBarModel(id: 0, name: 'All'),
  TapBarModel(id: 1, name: 'Chairs'),
  TapBarModel(id: 2, name: 'Lamps'),
  TapBarModel(id: 3, name: 'Tables'),
];
  Future<List<AllProduct>> getProductsByCategory(String category) async {
    final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/$category"));
    if (response.statusCode == 200) {
      return allproductFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
