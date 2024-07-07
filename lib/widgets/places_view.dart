import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesViewScreen extends StatelessWidget {
  const PlacesViewScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.file(
                  place.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  bottom: 15,
                  right: 15,
                  child: Icon(
                    Icons.room_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            Text(
              place.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
