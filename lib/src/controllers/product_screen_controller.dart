import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/all_products_model.dart';

class ProductScreenController extends GetxController {
  static ProductScreenController get instance => Get.find();
  RxList<ProductsModel> productList = <ProductsModel>[].obs;

  Future<List<ProductsModel>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        //print("API response data: $data");
        final List<ProductsModel> products =
            data.map((item) => ProductsModel.fromJson(item)).toList();
        productList.value = products;
        //print("Product List Length: ${productList.length}");
        return products;
      } else {
        debugPrint(
            "API request failed with status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return [];
    }
  }

  String truncateDescription(String description, int maxWords) {
    List<String> words = description.split(' ');
    if (words.length > maxWords) {
      return '${words.sublist(0, maxWords).join(' ')} ...';
    }
    return description;
  }
}
