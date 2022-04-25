import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/widgets/customstack.dart';

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
      body: Center(child: CustomStack()),
    );
  }
}
