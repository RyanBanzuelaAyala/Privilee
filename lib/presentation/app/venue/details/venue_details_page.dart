import 'package:TApp/domain/venue/venue.dart';
import 'package:TApp/shared/ui/common_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VenuePageDetails extends StatelessWidget {
  final Venue venue;

  const VenuePageDetails({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(context, title: venue.name),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                imageGallery(context),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    venue.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Opening hours: ${venue.openingHours[0].hours!}',
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 16),
                  Text(venue.overviewtext[0].text!,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 16),
                  ...venue.categories.map((category) => category.title != null
                      ? ExpansionTile(
                          title: Text(category.category!),
                          children: [
                              ListTile(
                                title: Text(category.title!,
                                    style: const TextStyle(fontSize: 12)),
                              )
                            ])
                      : ListTile(
                          title: Text(category.category!,
                              style: const TextStyle(fontSize: 14)))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CarouselSlider imageGallery(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0, // Ensures full width usage
      ),
      items: venue.images.map((image) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width, // Makes it full width
            child: Image.network(
              image.url!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Image not available'));
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
