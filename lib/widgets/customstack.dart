import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/updateproductpage.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, required this.product}) : super(key: key);
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 40.0,
                  spreadRadius: 0.0,
                  offset: Offset(
                    10.0,
                    10.0,
                  ),
                ),
              ],
            ),
            child: Card(
                elevation: 15,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${product.title}',
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                          IconButton(
                            icon:
                                Icon(FontAwesomeIcons.heart, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
          Positioned(
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
            top: -70,
            right: 10,
          ),
        ],
      ),
    );
  }
}
