import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  static const routeName = '/Details';

  // Function to get pokemon data
  Future<Map<String, dynamic>> fetchPokemon(String name) async {
    final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (res.statusCode == 200) {
      // If the server returned a 200 OK response, parse the JSON.
      final result = json.decode(res.body);
      return result as Map<String, dynamic>;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to fetch Pokemons');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the pokemon name in order to fetch the data on him
    final pokemonName = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Pokedex"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: fetchPokemon(pokemonName.toString()),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still running, show a loading indicator.
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If an error occurred, display an error message.
              return Text('Error: ${snapshot.error}');
            } else {
              // If the Future is complete, display the fetched data.
              final pokemonData = snapshot.data;

              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.lightGreen.shade100,
                child: Column(
                  children: [
                    Text(pokemonData?['name'] ?? ''),
                    const Text('Abilities:'),
                    // Iterate over the abilities list and display each ability.
                    for (var ability in pokemonData?['abilities'] ?? [])
                      Text(ability['ability']['name'].toString()),

                    const Text('Types:'),
                    // Iterate over the types list and display each type.
                    for (var type in pokemonData?['types'] ?? [])
                      Text(type['type']['name'].toString()),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
