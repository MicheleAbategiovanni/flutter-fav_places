import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/screens/home_screen.dart';
import 'package:favorite_places/widgets/places_view.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case '/add-place':
        return MaterialPageRoute(builder: (context) => const AddPlaceScreen());

      case '/place-view':
        if (args is Place) {
          return MaterialPageRoute(
              builder: (context) => PlacesViewScreen(place: args));
        }
        return MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(), // Schermata di errore o gestione alternativa
        );

      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
