import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    Api api = Api();
    http.Response response =
        await api.get(url: 'https://fakestoreapi.com/categories');
    List<dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> categories =
        jsonResponse.map((category) => category).toList();
    return categories;
  }
}
