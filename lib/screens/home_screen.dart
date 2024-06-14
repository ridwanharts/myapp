import 'package:flutter/material.dart';
import 'package:myapp/models/pokemon.dart';
import 'package:provider/provider.dart';
import '../providers/pokemon_provider.dart';
import '../widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Pokemon charizard = Pokemon(
      id: 1,
      name: "charizard",
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
      type: "fire",
      backgroundUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png",
    );

    Pokemon venusaur = Pokemon(
      id: 2,
      name: "venusaur",
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      type: "grass",
      backgroundUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
    );

    Pokemon blastoise = Pokemon(
      id: 3,
      name: "blastoise",
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png",
      type: "water",
      backgroundUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('CARD VIEW'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          PokemonCard(pokemon: charizard),
          PokemonCard(pokemon: venusaur),
          PokemonCard(pokemon: blastoise),
        ],
      ),
    );
  }
}
