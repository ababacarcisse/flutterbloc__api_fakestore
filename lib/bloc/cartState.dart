import '../models/CartItem.dart';

class CartState {
  final List<CartItem> items;
  final double total;

  CartState({
    required this.items,
    required this.total,
  });

  CartState copyWith({
    List<CartItem>? items,
    double? total,
  }) {
    return CartState(
      items: items ?? this.items,
      total: total ?? this.total,
    );
  }
}
