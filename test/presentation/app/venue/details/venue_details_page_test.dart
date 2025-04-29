import 'package:TApp/domain/venue/venue_categories.dart';
import 'package:TApp/domain/venue/venue_coordinates.dart';
import 'package:TApp/domain/venue/venue_image.dart';
import 'package:TApp/domain/venue/venue_openinghours.dart';
import 'package:TApp/domain/venue/venue_overviewtext.dart';
import 'package:TApp/domain/venue/venue_thingstodo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:TApp/domain/venue/venue.dart';
import 'package:TApp/presentation/app/venue/details/venue_details_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  testWidgets('Venue details page renders correctly',
      (WidgetTester tester) async {
    // Create a mock venue object with correct data types
    final Venue testVenue = Venue(
      name: 'Test Venue',
      location: 'Test Location',
      type: 'Test Type',
      images: [Venue_Image(url: 'image1.jpg'), Venue_Image(url: 'image2.jpg')],
      overviewtext: [OverViewText(text: 'This is a test venue.')],
      thingsToDo: [
        ThingsToDo(title: 'Activity 1'),
        ThingsToDo(title: 'Activity 2')
      ],
      categories: [
        Categories(title: 'Category 1'),
        Categories(title: 'Category 2')
      ],
      openingHours: [OpeningHours(hours: '9:00 AM - 5:00 PM')],
      coordinates: Coordinates(lat: 0.0, lng: 0.0),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: VenuePageDetails(venue: testVenue),
      ),
    );

    await tester.pumpAndSettle();

    // Verify the carousel slider is displayed
    expect(find.byType(CarouselSlider), findsOneWidget);
  });
}
