import 'package:ecommerce_app/ui/composante/fonction.dart';
import 'package:flutter/material.dart';

import '../ui/cartPage.dart';
import '../ui/composante/my_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.white,
      margin: EdgeInsets.only(top: 50.0),
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.menu),
          InkWell(
            onTap: () {},
            splashColor: MyColor.white,
            child: Container(
              height: 65.0,
              width: 50.0,
              decoration: const BoxDecoration(
                color: MyColor.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              // ignore: prefer_const_constructors
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                onPressed: () {
                  navigateToPage(context, CartPage());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
