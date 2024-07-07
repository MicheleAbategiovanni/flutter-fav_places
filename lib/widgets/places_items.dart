import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesItemsScreen extends StatelessWidget {
  const PlacesItemsScreen({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'Ops... Non hai ancora aggiunti dei posti !',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            '/place-view',
            arguments: places[index],
          ),
          child: Column(
            children: [
              Image.file(
                places[index].image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              Text(
                places[index].title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
