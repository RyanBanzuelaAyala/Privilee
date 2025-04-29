import 'package:TApp/domain/venue/venue_coordinates.dart';
import 'package:TApp/shared/extension/base_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VenuePageMapVM extends BaseVM {
  LatLng initialPosition = const LatLng(25.12947228950527, 55.153158903121955);

  late GoogleMapController mapController;
  Set<Marker> markers = {};

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void updateMarkers(List<Coordinates> coordinates) {
    markers = coordinates
        .map((coord) => Marker(
              markerId: MarkerId("${coord.lat},${coord.lng}"),
              position: LatLng(coord.lat!, coord.lng!),
            ))
        .toSet();

    isPageLoading = false;
    notifyListeners();
  }
}
