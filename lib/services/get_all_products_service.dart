import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    Api api = Api();
    http.Response response =
        await api.get(url: 'https://fakestoreapi.com/products');
    List<dynamic> jsonResponse = json.decode(response.body);
    List<ProductModel> products =
        jsonResponse.map((product) => ProductModel.fromJson(product)).toList();
    return products;
  }
}
