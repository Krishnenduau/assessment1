class CategoryResponse {
  bool? success;
  String? message;
  List<CategoryModel>? data;

  CategoryResponse({this.success, this.message, this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryModel>[];
      json['data'].forEach((v) {
        data!.add(new CategoryModel.fromJson(v));
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

class CategoryModel {
  int? id;
  String? catgName;
  String? active;

  CategoryModel({this.id, this.catgName, this.active});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catgName = json['catg_name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catg_name'] = this.catgName;
    data['active'] = this.active;
    return data;
  }
}
