import 'package:favorite_places/provider/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  void _savePlace() {
    final titleInput = _titleController.text;
    if (titleInput.isEmpty) {
      return;
    }

    ref.read(userPlaceProvider.notifier).addPlace(titleInput);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    //
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aggiungi un nuovo posto'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const ImageInput(),
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Titolo',
                ),
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                label: const Text('Aggiungi'),
                icon: const Icon(Icons.add),
                onPressed: _savePlace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
