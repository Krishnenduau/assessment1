import 'dart:convert';

import 'package:assessment1/core/app_url.dart';
import 'package:assessment1/models/brands_model.dart';
import 'package:http/http.dart' as http;

class BrandService {
  static Future<List<BrandModel>> fetchBrands(String productId) async {
    print("name1");

    final url = Uri.parse(AppUrl.brdcat + "?id=$productId");

    print("name2");
    final response = await http.post(url);
    print("name3");
    if (response.statusCode == 200) {
      print("name5");
      final resposeData = BrandsResponse.fromJson(jsonDecode(response.body));
      print("name4");
      return resposeData.data ?? [];
    } else {
      throw Exception('Failed to load products');
    }
  }
}
