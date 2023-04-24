import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/allproduct.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../models/CartItem.dart';
import '../models/category.dart';
import '../models/singleProduct.dart';
import 'cartState.dart';

part 'product_event.dart';
part 'product_state.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      final responseC = await http.get(
        Uri.parse('https://fakestoreapi.com/products/categories'),
      );

// Dans la méthode GetProductEvent
      final cartState = CartState(items: [], total: 0);

      emit(ProductSuccess(
          products: allproductFromJson(response.body),
          categories: categorieFromJson(responseC.body),
          cartState: cartState));

      on<AddToCartEvent>((event, emit) {
        final state = this.state;
        if (state is ProductSuccess) {
          final existingItemIndex = state.cartState.items
              .indexWhere((item) => item.productId == event.item.productId);

          if (existingItemIndex >= 0) {
            state.cartState.items[existingItemIndex].incrementQuantity();
          } else {
            final newItem = CartItem(
              productId: event.item.productId,
              title: event.item.title,
              price: event.item.price,
              image: event.item.image,
            );
            final newItems = [newItem, ...state.cartState.items];
            final newTotal = state.cartState.total + newItem.price;
            final newCartState = CartState(items: newItems, total: newTotal);

            emit(state.copyWith(cartState: newCartState));
          }
        }
      });

      on<RemoveFromCartEvent>((event, emit) {
        final state = this.state as ProductSuccess;

        state.cartState.items
            .removeWhere((item) => item.productId == event.item.productId);

        final total = state.cartState.items
            .fold(0.0, (acc, item) => acc + (item.price * item.quantity));

        emit(state.copyWith(cartState: state.cartState.copyWith(total: total)));
      });
    });
  }
}
