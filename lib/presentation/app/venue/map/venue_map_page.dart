import 'package:TApp/domain/venue/venue_coordinates.dart';
import 'package:TApp/presentation/app/venue/map/venue_map_vm.dart';
import 'package:TApp/shared/ui/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  final List<Coordinates> coordinates;

  const MapPage({super.key, required this.coordinates});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VenuePageMapVM>(
        create: (context) => VenuePageMapVM(),
        child: Consumer<VenuePageMapVM>(
            builder: (BuildContext context, model, Widget? child) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!model.isInitLoaded) {
              model.setInitLoad = true;
              model.updateMarkers(coordinates);
            }
          });

          return Scaffold(
            appBar: TAppBar(context),
            body: model.isPageLoading
                ? Center(child: TshowLoader())
                : GoogleMap(
                    onMapCreated: model.onMapCreated,
                    initialCameraPosition:
                        CameraPosition(target: model.initialPosition, zoom: 12),
                    markers: model.markers,
                  ),
          );
        }));
  }
}
