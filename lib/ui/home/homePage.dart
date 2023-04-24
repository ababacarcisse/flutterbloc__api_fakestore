import 'package:ecommerce_app/ui/composante/fonction.dart';
import 'package:ecommerce_app/widget/tab_bar_menu.dart';
import 'package:flutter/material.dart';

import '../../api/api_connexion.dart';
import '../../models/allproduct.dart';
import '../../widget/allProductsWidget.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/tabBarBarButton.dart';
import '../composante/CategoryPage.dart';
import '../composante/my_color.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({
    super.key,
  });

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:
            // ignore: prefer_const_literals_to_create_immutables
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const CustomAppBar(),
              const Text(
                "One Store  ",
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                "Regarder ces vetement de qualité",
                style: TextStyle(color: MyColor.black),
              ),
              const SizedBox(
                height: 20,
              ),
              //le tabar
              Expanded(child: AllProductsWidget()),
            ]),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 100.0,
          color: MyColor.black,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 40.0,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: MyColor.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bottomNavButton(
                      onPress: () {},
                      icon: Icons.home_outlined,
                    ),
                    const SizedBox(width: 60),
                    bottomNavButton(
                      onPress: () {
                        navigateToPage(context,  const CategoryPage());
                      },
                      icon: Icons.category,
                    ),
                    const SizedBox(width: 60),
                    bottomNavButton(
                      onPress: () {},
                      icon: Icons.settings_ethernet_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton bottomNavButton(
      {required Function() onPress, required IconData icon}) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        size: 40,
        color: MyColor.white,
      ),
    );
  }
}
