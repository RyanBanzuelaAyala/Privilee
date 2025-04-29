import 'dart:convert';
import 'package:TApp/domain/venue/venue.dart';
import 'package:TApp/domain/venue/venue_categories.dart';
import 'package:TApp/domain/venue/venue_coordinates.dart';
import 'package:TApp/domain/venue/venue_image.dart';
import 'package:TApp/domain/venue/venue_openinghours.dart';
import 'package:TApp/domain/venue/venue_overviewtext.dart';
import 'package:TApp/domain/venue/venue_thingstodo.dart';
import 'package:TApp/shared/extension/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class VenuePageVM extends BaseVM {
  final http.Client client;
  final String baseUrl = "https://www.privilee.ae/api/map/hotel";

  VenuePageVM({http.Client? client}) : client = client ?? http.Client();

  var btnctrl1 = RoundedLoadingButtonController();

  var activeIndex = 0;
  set setActiveIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

  var searchController = TextEditingController();
  var venues = <Venue>[];
  var venuesTmp = <Venue>[];

  List<String> thingsToDoTitles = [];
  List<String> openingHours = [];

  List<Coordinates> coordinatesVenue = [];

  var filteredVenues = <Venue>[];

  String selectedType = "All";
  String selectedFacility = "All";
  bool familyAccess = false;
  bool guestAccess = false;

  Future<void> fetchVenues() async {
    try {
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        var venuesInternal = result["items"].map<Venue>((item) {
          item["images"] = (item["images"] as List)
              .map<Venue_Image>((image) => Venue_Image.fromJson(image))
              .toList();
          item["overviewText"] = (item["overviewText"] as List)
              .map<OverViewText>(
                  (overviewtext) => OverViewText.fromJson(overviewtext))
              .toList();
          item["thingsToDo"] = (item["thingsToDo"] as List)
              .map<ThingsToDo>((thingsToDo) => ThingsToDo.fromJson(thingsToDo))
              .toList();
          item["categories"] = (item["categories"] as List)
              .map<Categories>((categories) => Categories.fromJson(categories))
              .toList();

          for (var tt in item["thingsToDo"]) {
            thingsToDoTitles.add(tt.title!);
          }

          var openingHoursList = (item["openingHours"] as Map<String, dynamic>)
              .map((key, value) => MapEntry(key, OpeningHours.fromJson(value)));

          openingHoursList.forEach((key, value) {
            openingHours.add(value.hours!);
          });

          item["openingHours"] = openingHoursList.values.toList();
          var venueCoordinate = Coordinates.fromJson(item["coordinates"]);

          item["coordinates"] = venueCoordinate;
          coordinatesVenue.add(venueCoordinate);

          return Venue.fromJson(item);
        }).toList();

        venues = venuesInternal;
        venuesTmp = venuesInternal;

        isPageLoading = false;
        notifyListeners();
      } else {
        throw Exception("Failed to load venues");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  void searchVenues(String query) {
    if (query.isEmpty) {
      venues = venuesTmp;
    } else {
      filteredVenues = venues
          .where(
              (venue) => venue.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      venues = filteredVenues;
    }
    notifyListeners();
  }

  void filterCategory(String category) {
    venues = venuesTmp;
    filteredVenues = venues
        .where((venue) => venue.thingsToDo.any((thing) =>
            thing.title != null &&
            thing.title!.toLowerCase().contains(category.toLowerCase())))
        .toList();

    venues = filteredVenues;

    notifyListeners();
  }
}
