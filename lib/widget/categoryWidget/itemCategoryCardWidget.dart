import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';

import '../../models/allproduct.dart';
import '../../models/category.dart';
import '../../ui/composante/text_style.dart';
import '../../ui/home/productPage/detailsPage.dart';


class ItemCategoryCard extends StatelessWidget {
  Category categorie;

  ItemCategoryCard({Key? key, required this.categorie}) : super(key: key);

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FancyContainer(
          title: categorie.name,
          titleStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class ItemProductCard extends StatelessWidget {
  final AllProduct product;

  const ItemProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: product),
            ),
          );
        },
        child: Container(
          height: 140.0,
          margin: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140.0,
                child: Image.network(product.image),
              ),
              // complet
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.title.substring(0, 18),
                      style: itemCardHeading,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description,
                      maxLines: 3,
                      style: itemCardDes,
                    ),
                    //      const SizedBox(height: 15.0),
                    Text(
                      "\$${product.price}",
                      style: itemCardPrice,
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                icon: const Icon(
                  Icons.favorite_border_outlined,
                ),
              ),
            ],
          ),
        ),
    
    );
  }
}
