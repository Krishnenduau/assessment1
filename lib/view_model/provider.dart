import 'package:assessment1/models/brands_model.dart';
import 'package:assessment1/models/category_model.dart';
import 'package:assessment1/models/product_model.dart';
import 'package:assessment1/services/get_brands.dart';
import 'package:assessment1/services/get_category.dart';
import 'package:assessment1/services/get_products.dart';
import 'package:flutter/material.dart';
class HomeProvider extends ChangeNotifier {
  bool isVisible = true;
  ProductModel? selectedProduct;
  BrandModel? selectedBrand;
  String _selectedValue = '';
  CategoryModel? selectedCategory; 

  String get selectedValue => _selectedValue;

  // Maintain a list to keep track of the visibility of each dropdown container
  List<bool> _dropdownVisibility = [true];

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

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void addDropdown() {
    // Add a new dropdown container and set its visibility to true
    _dropdownVisibility.add(true);
    notifyListeners();
  }

  void removeDropdown(int dropdownIndex) {
  if (_dropdownVisibility.isNotEmpty && dropdownIndex >= 0 && dropdownIndex < _dropdownVisibility.length) {
    _dropdownVisibility.removeAt(dropdownIndex); // Remove the dropdown at the specified index
    notifyListeners();
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
