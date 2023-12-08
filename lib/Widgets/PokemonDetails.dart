import 'package:flutter/material.dart';
import 'package:pokemon/Models/PokemonModel.dart';

class PokemonDetails extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Name: ${pokemon.name}'),
            Text('Type: ${pokemon.type}'),
          ],
        ),
      ),
    );
  }
}
