import 'package:favorite_places/provider/user_places.dart';
import 'package:favorite_places/widgets/places_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    //
    _placesFuture = ref.read(userPlaceProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : PlacesItemsScreen(places: userPlaces),
      ),
    );
  }
}
