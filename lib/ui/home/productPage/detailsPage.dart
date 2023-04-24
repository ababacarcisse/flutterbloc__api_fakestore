import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/product_bloc.dart';
import '../../../models/CartItem.dart';
import '../../../models/allproduct.dart';
import '../../../widget/QuantitySelector .dart';
import '../../cartPage.dart';
import '../../composante/fonction.dart';
import '../../composante/text_style.dart';

class ProductDetailsPage extends StatefulWidget {
  final AllProduct product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = [];
    int quantity = 0;
    void addToCart(AllProduct product, {int quantity = 1}) {
      final productBloc = context.read<ProductBloc>();
      productBloc.add(AddToCartEvent(
          item: CartItem(
        productId: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        quantity: quantity,
      )));
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Produit ajouté au panier'),
          content: Text('${product.title} x $quantity a été ajouté au panier.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const Text("Details Page"),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              onPressed: () {
                navigateToPage(context, CartPage());
              },
            ),
          ],
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.network(
                    widget.product.image,
                    height: 350.0,
                    width: 350,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(26),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.product.title,
                                style: styleP,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 14),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '\$${widget.product.price}',
                                style: itemCardPrice,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Text(
                            widget.product.description,
                            style: itemCardDes,
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom:
                20, // adjust this value to change the vertical position of the button
            left:
                0, // adjust this value to change the horizontal position of the button
            right: 0,
            child: Row(children: [
              // count
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(999)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: QuantitySelector(
                        onQuantityChanged: (newQuantity) {
                          setState(() {
                            quantity = newQuantity;
                          });
                        },
                        quantity: quantity,
                      )),
                ),
              ),
              Positioned(
                bottom:
                    20, // adjust this value to change the vertical position of the button
                left:
                    0, // adjust this value to change the horizontal position of the button
                right: 0,
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      return addToCart(widget.product, quantity: quantity);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text("Add to Card"),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
