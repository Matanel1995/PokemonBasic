import 'package:flutter/material.dart';

class PokemonBox extends StatelessWidget {
  final String pokemonName;

  const PokemonBox({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        color: Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Name: $pokemonName'),
            //add here navigation to details pade (including the pokemon Name!)
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Details', arguments: pokemonName);
            }, child: const Text('Details ->'))
          ],
        ),
      ),
    );
  }
}
