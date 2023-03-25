import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/product_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);

      var json = response.data;
      // print(json);
      return postFromJson(json);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception(error);
    }
  }
}
