import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:TApp/presentation/app/venue/venue_vm.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Create a mock HTTP client
class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient mockClient;
  late VenuePageVM venuePageVM;

  setUp(() {
    mockClient = MockClient();
    venuePageVM = VenuePageVM(client: mockClient); // Inject mock client
  });

  test('Fetch venues successfully', () async {
    final mockResponse = {
      "items": [
        {
          "name": "Beach Club",
          "thingsToDo": [
            {"title": "Swimming"}
          ],
          "coordinates": {"latitude": 25.276987, "longitude": 55.296249}
        }
      ]
    };

    when(mockClient.get(Uri.parse(venuePageVM.baseUrl)))
        .thenAnswer((_) async => http.Response(json.encode(mockResponse), 200));

    await venuePageVM.fetchVenues();

    expect(venuePageVM.venues, isNotEmpty);
    expect(venuePageVM.thingsToDoTitles, contains("Swimming"));
  });

  test('Handle failed API fetch', () async {
    when(mockClient.get(Uri.parse(venuePageVM.baseUrl)))
        .thenAnswer((_) async => http.Response("Not Found", 404));

    expect(() => venuePageVM.fetchVenues(), throwsException);
  });
}
