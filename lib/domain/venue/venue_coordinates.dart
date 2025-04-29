class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json["lat"] as double,
      lng: json["lng"] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
