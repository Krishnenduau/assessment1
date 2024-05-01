import 'dart:convert';
import 'package:assessment1/core/app_url.dart';
import 'package:assessment1/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  static Future<List<ProductModel>> fetchProducts(String catrId) async {
    // final url = Uri.parse(AppUrl.prdtcat);

    final url = Uri.parse(AppUrl.prdtcat + "?id=$catrId");

    final response = await http.post(url);

    if (response.statusCode == 200) {
      final resposeData = ProductResponse.fromJson(jsonDecode(response.body));

      return resposeData.data ?? [];
    } else {
      throw Exception('Failed to load products');
    }
  }
}
