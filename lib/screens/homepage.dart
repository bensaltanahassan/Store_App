import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
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
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 80),
        child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 90),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(product: products[index]);
                  },
                  clipBehavior: Clip.none,
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      )),
    );
  }
}
