import 'package:TApp/presentation/app/venue/common/card/venue_card.dart';
import 'package:TApp/presentation/app/venue/common/category/venue_category.dart';
import 'package:TApp/presentation/app/venue/venue_vm.dart';
import 'package:TApp/router/route_builder.dart';
import 'package:TApp/shared/ui/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VenuePage extends StatelessWidget {
  const VenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VenuePageVM>(
        create: (context) => VenuePageVM(),
        child: Consumer<VenuePageVM>(
            builder: (BuildContext context, model, Widget? child) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!model.isInitLoaded) {
              model.setInitLoad = true;
              model.fetchVenues();
            }
          });

          return Scaffold(
            appBar: TAppBar(context),
            body: model.isPageLoading
                ? Center(child: TshowLoader())
                : Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listOfCategory(model),
                            const SizedBox(height: 16),
                            searchVenue(model),
                            const SizedBox(height: 16),
                            Text(
                              '${model.venues.length} Pool & Beach Venues',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            listOfVenue(model),
                            const SizedBox(height: 70),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 30,
                        right: 30,
                        child: Column(
                          children: [
                            TButton("View Venue in Map", Icons.map,
                                Colors.grey.shade400, model.btnctrl1, () {
                              Navigator.of(context).push(
                                  mapDetailPageRoute(model.coordinatesVenue));
                            }),
                            const SizedBox(height: 10),
                            TButton(
                                "Join Privilee today!",
                                Icons.arrow_forward_outlined,
                                Colors.grey.shade100,
                                model.btnctrl1,
                                () {})
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        }));
  }

  Expanded listOfVenue(VenuePageVM model) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: model.venues.length,
        itemBuilder: (context, index) {
          return VenueCard(venue: model.venues[index]);
        },
      ),
    );
  }

  TextField searchVenue(VenuePageVM model) {
    return TextField(
      controller: model.searchController,
      decoration: InputDecoration(
        hintText: 'Search for venue',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: (query) {
        model.searchVenues(query);
      },
    );
  }

  SingleChildScrollView listOfCategory(VenuePageVM model) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            model.thingsToDoTitles.length,
            (index) => GestureDetector(
              onTap: () {
                model.setActiveIndex = index;
                model.filterCategory(model.thingsToDoTitles[index]);
              },
              child: CategoryTab(
                label: model.thingsToDoTitles[index],
                isActive: index == model.activeIndex,
              ),
            ),
          ),
        ));
  }
}
