import 'package:assessment1/models/brands_model.dart';
import 'package:assessment1/models/category_model.dart';
import 'package:assessment1/models/product_model.dart';
import 'package:assessment1/services/get_brands.dart';
import 'package:assessment1/services/get_category.dart';
import 'package:assessment1/services/get_products.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  ProductModel? selectedProduct;
  BrandModel? selectedBrand;
  String _selectedValue = '';
  CategoryModel? selectedCategory; // Add selectedCategory variable

  String get selectedValue => _selectedValue;
  List<bool> _dropdownVisibility = [false];

  List<bool> get dropdownVisibility => _dropdownVisibility;
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<BrandModel> brands = [];

  Future<void> fetchCategories() async {
    try {
      categories = await CategoryService.fetchCategories();
      notifyListeners();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchProducts(String id) async {
    try {
      products = await ProductsService.fetchProducts(id);
      notifyListeners();
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  Future<void> fetchBrands(String id) async {
    try {
      brands = await BrandService.fetchBrands(id);
      notifyListeners();
    } catch (e) {
      print('Error fetching brands: $e');
    }
  }

  void toggleDropdown() {
    _dropdownVisibility.add(true);
    notifyListeners();
  }

  void addDropdown() {
    _dropdownVisibility.add(true);
    notifyListeners();
  }

  void removeDropdown() {
    if (_dropdownVisibility.isNotEmpty) {
      _dropdownVisibility.removeLast();
    }
  }

  void setSelectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }

  void updateCategory(CategoryModel? category) {
    selectedCategory = category;
    fetchProducts(category!.id.toString());
    notifyListeners();
  }

  void updateProduct(ProductModel? product) {
    selectedProduct = product;
    fetchBrands(product!.id.toString());
    notifyListeners();
  }

  void updateBrand(BrandModel? brand) {
    selectedBrand = brand;
    notifyListeners();
  }
}
