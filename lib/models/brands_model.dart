class BrandsResponse {
  bool? success;
  String? message;
  List<BrandModel>? data;

  BrandsResponse({this.success, this.message, this.data});

  BrandsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BrandModel>[];
      json['data'].forEach((v) {
        data!.add(new BrandModel.fromJson(v));
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

class BrandModel {
  String? id;
  String? category;
  String? brand;

  BrandModel({this.id, this.category, this.brand});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    brand = json['Brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['Brand'] = this.brand;
    return data;
  }
}
