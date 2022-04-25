import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('New Trend', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.angleLeft, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Center(
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
            width: 250,
            height: 150,
            child: Card(
                elevation: 15,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Product1',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('200 \$',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24)),
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
              'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
              height: 100,
              width: 100,
            ),
            top: -40,
            left: 140,
          ),
        ],
      )),
    );
  }
}
