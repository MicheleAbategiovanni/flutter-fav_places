import 'package:favorite_places/provider/user_places.dart';
import 'package:favorite_places/widgets/places_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('I tuoi Posti'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Aggiungi Posto',
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, '/add-place');
            },
          ),
        ],
      ),
      body: PlacesItemsScreen(places: userPlaces),
    );
  }
}
