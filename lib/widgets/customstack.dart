import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomStack extends StatelessWidget {
  CustomStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      'Product1',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('200 \$',
                            style:
                                TextStyle(color: Colors.black, fontSize: 24)),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.heart, color: Colors.red),
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
            'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
            height: 100,
            width: 100,
          ),
          top: -70,
          right: 10,
        ),
      ],
    );
  }
}
