///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class privacypolicyContent {
/*
{
  "_id": "65d485204d634a2d8cc996a9",
  "title": "Privacy Policy",
  "content": "We are committed to protecting your privacy. Read our policy to learn more.",
  "createdAt": "2024-02-20T10:55:28.502Z",
  "updatedAt": "2024-02-20T10:55:28.509Z",
  "__v": 0
}
*/

  String? Id;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? V;

  privacypolicyContent({
    this.Id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  privacypolicyContent.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    title = json['title']?.toString();
    content = json['content']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['title'] = title;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class privacypolicy {
/*
{
  "content": {
    "_id": "65d485204d634a2d8cc996a9",
    "title": "Privacy Policy",
    "content": "We are committed to protecting your privacy. Read our policy to learn more.",
    "createdAt": "2024-02-20T10:55:28.502Z",
    "updatedAt": "2024-02-20T10:55:28.509Z",
    "__v": 0
  }
}
*/

  privacypolicyContent? content;

  privacypolicy({
    this.content,
  });
  privacypolicy.fromJson(Map<String, dynamic> json) {
    content = (json['content'] != null)
        ? privacypolicyContent.fromJson(json['content'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.toJson();
    }
    return data;
  }
}