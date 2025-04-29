class Venue_Image {
  String? url;
  String? id;

  Venue_Image({this.url, this.id});

  Venue_Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    return data;
  }
}
