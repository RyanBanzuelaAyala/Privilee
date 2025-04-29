class Categories {
  String? id;
  String? category;
  String? title;

  Categories({this.id, this.category, this.title});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['title'] = title;

    return data;
  }
}
