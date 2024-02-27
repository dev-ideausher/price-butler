///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CategoriesDataChildCategories {
/*
{
  "_id": "65b7783f503d2e949a166277",
  "name": "Mobile Phones and Accessories",
  "parentCategory": "65b7783e503d2e949a166270",
  "createdAt": "2024-01-29T10:04:47.285Z",
  "updatedAt": "2024-01-29T10:04:47.286Z",
  "__v": 0
}
*/

  String? Id;
  String? name;
  String? parentCategory;
  String? createdAt;
  String? updatedAt;
  int? V;

  CategoriesDataChildCategories({
    this.Id,
    this.name,
    this.parentCategory,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  CategoriesDataChildCategories.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    name = json['name']?.toString();
    parentCategory = json['parentCategory']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['name'] = name;
    data['parentCategory'] = parentCategory;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class CategoriesData {
/*
{
  "_id": "65b7783e503d2e949a166270",
  "name": "Electronics",
  "createdAt": "2024-01-29T10:04:46.201Z",
  "updatedAt": "2024-01-29T10:04:46.209Z",
  "__v": 0,
  "childCategories": [
    {
      "_id": "65b7783f503d2e949a166277",
      "name": "Mobile Phones and Accessories",
      "parentCategory": "65b7783e503d2e949a166270",
      "createdAt": "2024-01-29T10:04:47.285Z",
      "updatedAt": "2024-01-29T10:04:47.286Z",
      "__v": 0
    }
  ],
  "numChildCategories": 2
}
*/

  String? Id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? V;
  List<CategoriesDataChildCategories?>? childCategories;
  int? numChildCategories;

  CategoriesData({
    this.Id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.V,
    this.childCategories,
    this.numChildCategories,
  });
  CategoriesData.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    name = json['name']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
    if (json['childCategories'] != null) {
      final v = json['childCategories'];
      final arr0 = <CategoriesDataChildCategories>[];
      v.forEach((v) {
        arr0.add(CategoriesDataChildCategories.fromJson(v));
      });
      childCategories = arr0;
    }
    numChildCategories = json['numChildCategories']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    if (childCategories != null) {
      final v = childCategories;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['childCategories'] = arr0;
    }
    data['numChildCategories'] = numChildCategories;
    return data;
  }
}

class Categories {
/*
{
  "data": [
    {
      "_id": "65b7783e503d2e949a166270",
      "name": "Electronics",
      "createdAt": "2024-01-29T10:04:46.201Z",
      "updatedAt": "2024-01-29T10:04:46.209Z",
      "__v": 0,
      "childCategories": [
        {
          "_id": "65b7783f503d2e949a166277",
          "name": "Mobile Phones and Accessories",
          "parentCategory": "65b7783e503d2e949a166270",
          "createdAt": "2024-01-29T10:04:47.285Z",
          "updatedAt": "2024-01-29T10:04:47.286Z",
          "__v": 0
        }
      ],
      "numChildCategories": 2
    }
  ]
}
*/

  List<CategoriesData?>? data;

  Categories({
    this.data,
  });
  Categories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <CategoriesData>[];
      v.forEach((v) {
        arr0.add(CategoriesData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}