import 'package:TApp/domain/venue/venue_categories.dart';
import 'package:TApp/domain/venue/venue_coordinates.dart';
import 'package:TApp/domain/venue/venue_image.dart';
import 'package:TApp/domain/venue/venue_openinghours.dart';
import 'package:TApp/domain/venue/venue_overviewtext.dart';
import 'package:TApp/domain/venue/venue_thingstodo.dart';

class Venue {
  final String name;
  final String type;
  final List<Venue_Image> images;
  final String location;
  final List<OverViewText> overviewtext;
  final List<ThingsToDo> thingsToDo;
  final List<Categories> categories;
  final List<OpeningHours> openingHours;
  final Coordinates coordinates;

  Venue(
      {required this.name,
      required this.type,
      required this.images,
      required this.location,
      required this.overviewtext,
      required this.thingsToDo,
      required this.categories,
      required this.openingHours,
      required this.coordinates});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      images: List<Venue_Image>.from(json['images'] ?? []),
      overviewtext: List<OverViewText>.from(json['overviewText'] ?? []),
      thingsToDo: List<ThingsToDo>.from(json['thingsToDo'] ?? []),
      categories: List<Categories>.from(json['categories'] ?? []),
      openingHours: List<OpeningHours>.from(json['openingHours'] ?? []),
      location: json['location'] ?? '',
      coordinates: json['coordinates'] ?? {},
    );
  }
}
