class OverViewText {
  String? type;
  String? text;

  OverViewText({this.type, this.text});

  OverViewText.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['text'] = this.text;

    return data;
  }
}
