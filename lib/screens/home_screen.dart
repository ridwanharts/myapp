import 'package:flutter/material.dart';
import 'package:myapp/models/pokemon.dart';
import 'package:provider/provider.dart';
import '../models/pokemon_species.dart';
import '../providers/pokemon_provider.dart';
import '../widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PokemonSpecies> _futurePokemonSpecies;

  @override
  void initState() {
    super.initState();
    //_futurePokemonSpecies = PokemonProvider.fetchSpeciesData(1);
  }

  @override
  Widget build(BuildContext context) {
    Pokemon charizard = Pokemon(
      id: 1,
      name: "charizard",
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
      types: ["fire", "flying"],
      backgroundUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png",
    );

    Pokemon venusaur = Pokemon(
      id: 2,
      name: "venusaur",
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      types: ["grass", "poison"],
      backgroundUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
    );

    Pokemon blastoise = Pokemon(
      id: 3,
      name: "blastoise",
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png",
      types: ["water"],
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
