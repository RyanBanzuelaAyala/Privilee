class OpeningHours {
  String? status;
  String? hours;

  OpeningHours({this.status, this.hours});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    hours = json['hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['hours'] = this.hours;
    return data;
  }
}
