import 'package:assessment1/models/brands_model.dart';
import 'package:assessment1/models/category_model.dart';
import 'package:assessment1/models/product_model.dart';
import 'package:assessment1/view_model/provider.dart';
import 'package:assessment1/services/get_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownWidget extends StatelessWidget {
  final Key? widgetKey;
  final int dropdownIndex;
  final List<CategoryModel> categories;

  const DropdownWidget({
    required this.dropdownIndex,
    required this.categories,
    this.widgetKey,
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final homeProvider = context.watch<HomeProvider>();
    final selectedCategory = homeProvider.selectedCategory;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      key: widgetKey,
      child: Container(
        width: screenWidth * 0.88,
        height: 185,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.87,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        homeProvider.selectedCategory?.catgName == null
                            ? "Selected Category:"
                            : 'Selected Category: ${homeProvider.selectedCategory?.catgName}',
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<CategoryModel>>(
                        future: CategoryService.fetchCategories(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return DropdownButtonFormField<CategoryModel>(
                              onChanged: (CategoryModel? newValue) {
                                context
                                    .read<HomeProvider>()
                                    .updateCategory(newValue);
                              },
                              items: snapshot.data!.map((value) {
                                return DropdownMenuItem<CategoryModel>(
                                  value: value,
                                  child: Text(value.catgName ?? ""),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: screenWidth * 0.87,
                color: Colors.grey[200],
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Text(
                          homeProvider.selectedCategory?.catgName == null
                              ? 'Select Product:'
                              : 'Select Product: ${homeProvider.selectedProduct?.name}',
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      DropdownButton<ProductModel>(
                        onChanged: (ProductModel? newValue) {
                          context.read<HomeProvider>().updateProduct(newValue);
                        },
                        items: homeProvider.products
                            .map<DropdownMenuItem<ProductModel>>(
                                (ProductModel? value) {
                          return DropdownMenuItem<ProductModel>(
                            value: value,
                            child: Text(value!.name!),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: screenWidth * 0.85,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Text(
                        homeProvider.selectedBrand?.brand == null
                            ? 'Select Brand:'
                            : 'Select Brand: ${homeProvider.selectedBrand?.brand}',
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Consumer<HomeProvider>(
                      builder: (context, model, child) {
                        return DropdownButton<BrandModel>(
                          onChanged: (BrandModel? newValue) {
                            context.read<HomeProvider>().updateBrand(newValue);
                          },
                          items: homeProvider.brands
                              .map<DropdownMenuItem<BrandModel>>(
                                  (BrandModel? value) {
                            return DropdownMenuItem<BrandModel>(
                              value: value,
                              child: Text(value!.brand!),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
