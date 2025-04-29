import 'package:TApp/presentation/app/venue/map/venue_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  testWidgets('venue map page ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MapPage(
          coordinates: [],
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(GoogleMap), findsOneWidget);
  });
}
