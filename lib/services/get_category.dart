import 'dart:convert';
import 'package:assessment1/core/app_url.dart';
import 'package:assessment1/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<List<CategoryModel>> fetchCategories() async {
    final url = Uri.parse(AppUrl.category);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final resposeData = CategoryResponse.fromJson(jsonDecode(response.body));
      return resposeData.data ?? [];
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
