import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            final cartState = state.cartState;
            return Container(
              child: ListView.builder(
                itemCount: cartState.items.length,
                itemBuilder: (context, index) {
                  final cartItem = cartState.items[index];
                  return Dismissible(
                    key: ValueKey(cartItem.productId),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (_) async {
                      final result = await showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Remove Item'),
                          content: Text(
                              'Do you want to remove ${cartItem.title} from your cart?'),
                          actions: [
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () => Navigator.pop(context, false),
                            ),
                            TextButton(
                              child: Text('Remove'),
                              onPressed: () => Navigator.pop(context, true),
                            ),
                          ],
                        ),
                      );
                      return result ?? false;
                    },
                    onDismissed: (_) {
                      context
                          .read<ProductBloc>()
                          .add(RemoveFromCartEvent(item: cartItem));
                    },
                    child: Card(
                      elevation: 4,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        leading: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/loading.gif', // Placeholder image
                          image: cartItem.image!,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          cartItem.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '\$${cartItem.price} (x${cartItem.quantity})',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            final cartState = state.cartState;
            return Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: \$${cartState.total}'),
                  ElevatedButton(
                    child: Text('Checkout'),
                    onPressed: () {
                      //     context.read<ProductBloc>().add(CheckoutEvent());
                    },
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
