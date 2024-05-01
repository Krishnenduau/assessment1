class ProductResponse {
  bool? success;
  String? message;
  List<ProductModel>? data;

  ProductResponse({this.success, this.message, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  String? id;
  String? name;
  String? category;
  String? brand;

  ProductModel({this.id, this.name, this.category, this.brand});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    category = json['category'];
    brand = json['Brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['category'] = this.category;
    data['Brand'] = this.brand;
    return data;
  }
}
