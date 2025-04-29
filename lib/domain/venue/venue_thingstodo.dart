class ThingsToDo {
  String? title;
  String? badge;

  ThingsToDo({this.title, this.badge});

  ThingsToDo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    badge = json['badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['badge'] = this.badge;
    return data;
  }
}
