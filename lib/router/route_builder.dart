import 'package:TApp/domain/venue/venue.dart';
import 'package:TApp/domain/venue/venue_coordinates.dart';
import 'package:TApp/presentation/app/venue/details/venue_details_page.dart';
import 'package:TApp/presentation/app/venue/map/venue_map_page.dart';
import 'package:TApp/presentation/app/venue/venue_page.dart';
import 'package:flutter/material.dart';

Route venuePageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => VenuePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route venueDetailPageRoute(Venue venue) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        VenuePageDetails(venue: venue),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route mapDetailPageRoute(List<Coordinates> coordinates) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        MapPage(coordinates: coordinates),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
