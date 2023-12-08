import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pokemon/Models/PokemonModel.dart';

import 'package:pokemon/Widgets/PokemonBox.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> pokemonsList = [];
  List<PokemonModel> pokemonsModals = [];
  List<String> allPokemons = [];


  Future<dynamic> fetchPokemons() async {
    final res = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100&offset=0'));
    if (res.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final result = await json.decode(res.body);
      return result['results'];
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to fetch Pokemons');
    }
  }

  Future<dynamic> readJSon() async {

    final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100&offset=0'));
    final result = await json.decode(res.body);
    setState(() {
      pokemonsList = result['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pokedex"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: pokemonsList.length,
                  itemBuilder: (context, index) {
                    for (var pokemon in pokemonsList) {
                      // PokemonModel tempPokemon = PokemonModel(pokemon['name'], pokemon['type'], pokemon['skills']);
                      // pokemonsModals.add(tempPokemon);
                      allPokemons.add(pokemon['name']);
                    }
                    return PokemonBox(pokemonName: allPokemons[index]);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    readJSon();
                  },
                  child: const Center(
                    child: Text("Load Pokemons!"),
                  )
                ),
                ElevatedButton(
                    onPressed: () {setState(() {
                      pokemonsList = [];
                    });},
                    child: const Center(
                      child: Text("Clear Pokemons!"),
                    )
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}
