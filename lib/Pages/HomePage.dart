import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokemon/Widgets/PokemonBox.dart';

import 'package:pokemon/HP/api.dart' as hpApi;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Map<String, String>> pokemonsList = [];
  List<String> allPokemons = [];

  Future fetchPokemons({limit =100 ,offset= 0} ) async {
    var pokemonUrl = 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset';

    final res = await http.get(
        Uri.parse(pokemonUrl));
    final result = await json.decode(res.body);

    if (result['results'] != null) {
      List<Map<String, String>> pokemonList = (result['results'] as List).map((
          pokemonJson) {
        return {
          'name': pokemonJson['name'].toString(),
          'url': pokemonJson['url'].toString(),
        };
      }).toList();

      setState(() {
        pokemonsList = pokemonList;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
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
                  return PokemonBox(
                      pokemonName: pokemonsList[index]['name'] ?? '');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await fetchPokemons();
                  },
                  child: const Text("Load Pokemons!"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hpApi.callApi();
                      pokemonsList = [];
                    });
                  },
                  child: const Text("Clear Pokemons!"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
