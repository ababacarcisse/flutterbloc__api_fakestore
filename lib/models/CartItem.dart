class CartItem {
  final int productId;
  final String title;
    final String? image;

  final double price;
  int quantity;

  CartItem( {
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  void incrementQuantity() {
    quantity++;
  }
}
