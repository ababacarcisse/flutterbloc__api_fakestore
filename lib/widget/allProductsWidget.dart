import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../models/allproduct.dart';
import 'itemCard.dart';

Widget AllProductsWidget() {
  return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
    if (state is ProductLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ProductSuccess) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ItemCard(product: state.products[index]);
        },
        itemCount: state.products.length,
      );
    }
    return const Center(
      child: Text("NO DATA"),
    );
  });
}
