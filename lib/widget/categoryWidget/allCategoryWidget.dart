import 'package:ecommerce_app/models/allproduct.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc.dart';
import 'itemCategoryCardWidget.dart';

class AllCategoryWidget extends StatelessWidget {
  const AllCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProductSuccess) {
        return ListView.builder(
          itemBuilder: (context, index) {
            if (state.categories.isEmpty) {
              // handle the case where the list is empty
            } else {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryProductsPage(
                          category: state.categories[index],
                          products: _getProductsByCategory(
                              state.products, state.categories[index].name)),
                    ),
                  );
                },
                child: ItemCategoryCard(categorie: state.categories[index]),
              );
            }
          },
          itemCount: state.categories.length,
        );
      }
      return const Center(
        child: Text("NO DATA"),
      );
    });
  }

  List<AllProduct> _getProductsByCategory(
      List<AllProduct> products, String category) {
    return products.where((product) => product.category == category).toList();
  }
}

class CategoryProductsPage extends StatelessWidget {
  final Category category;
  final List<AllProduct> products;

  const CategoryProductsPage({
    Key? key,
    required this.category,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final product = products[index];
          return Expanded(child: ItemProductCard(product: product));
        },
        itemCount: products.length,
      ),
    );
  }
}
