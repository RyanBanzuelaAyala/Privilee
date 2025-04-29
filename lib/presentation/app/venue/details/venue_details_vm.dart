import 'dart:convert';
import 'package:TApp/domain/venue/venue.dart';
import 'package:TApp/domain/venue/venue_image.dart';
import 'package:TApp/shared/extension/base_widget.dart';
import 'package:http/http.dart' as http;

class VenuePageDetailsVM extends BaseVM {
  final String baseUrl = "https://www.privilee.ae/api/map/hotel";

  var venues = <Venue>[];

  VenuePageDetailsVM() {
    fetchVenues().then((value) {
      venues = value;
      notifyListeners();
    });
  }

  Future<List<Venue>> fetchVenues() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('https://www.privilee.ae/api/map/hotel'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var listData = await response.stream.bytesToString();
        var result = json.decode(listData);

        var venues = result["items"].map<Venue>((item) {
          item["images"] = (item["images"] as List)
              .map<Venue_Image>((image) => Venue_Image.fromJson(image))
              .toList();
          return Venue.fromJson(item);
        }).toList();

        return venues;
      } else {
        throw Exception("Failed to load venues");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
