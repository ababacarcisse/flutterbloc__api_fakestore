part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  CartState get initialCartState =>  CartState(items: [], total: 0);

  @override
  List<Object> get props => [];
}


class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}
// ignore: must_be_immutable
class ProductSuccess extends ProductState {
  final List<AllProduct> products;
  final List<Category> categories;
  final CartState cartState;

  const ProductSuccess({
    required this.categories,
    required this.products,
    required this.cartState,
  });

  @override
  List<Object> get props => [categories, products, cartState];

  ProductSuccess copyWith({
    List<AllProduct>? products,
    List<Category>? categories,
    CartState? cartState,
  }) {
    return ProductSuccess(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      cartState: cartState ?? this.cartState,
    );
  }
}


