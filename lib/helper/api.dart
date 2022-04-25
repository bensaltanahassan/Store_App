import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> get(
      {required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception('Failed to load data !!!!! ${response.statusCode} ');
  }

  Future<dynamic> post(
      {required String url,
      @required Map<String, String>? body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(uri, body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse;
    }
    throw Exception(
        'Failed to load data !!!!! ${response.statusCode} with body ${response.body}');
  }

  Future<dynamic> put(
      {required String url,
      @required Map<String, String>? body,
      @required String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url = $url and body = $body and token = $token');
    Uri uri = Uri.parse(url);
    http.Response response = await http.put(uri, body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse;
    }
    throw Exception(
        'Failed to load data !!!!! ${response.statusCode} with body ${response.body}');
  }
}
