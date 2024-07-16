import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:myapp/models/pokemon.dart';
import 'package:provider/provider.dart';
import '../models/pokemon_species.dart';
import '../providers/pokemon_provider.dart';
import '../widgets/pokemon_card.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
  }

  void _loadPokemon() async {
    final pokemonProvider = Provider.of<PokemonProvider>(context);
    for (var pokemon in pokemonProvider.pokemons) {
      if (pokemon.marker != null &&
          (pokemon.marker?.point.latitude != 0.0 ||
              pokemon.marker?.point.longitude != 0.0)) {
        markers.add(pokemon.marker!);
      }
    }
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

    print('markers.length: ${markers.length}');

    _loadPokemon();

    return Scaffold(
      appBar: AppBar(
        title: Text("MAP"),
        backgroundColor: Colors.white,
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialZoom: 3,
          initialCenter:
              LatLng(-7.4329305, 109.9209553), //-7.4329448,109.9220714
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            //subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: markers,
          ),
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('CARD VIEW'),
    //     backgroundColor: Colors.black,
    //   ),
    //   body: ListView(
    //     padding: EdgeInsets.zero,
    //     children: [
    //       PokemonCard(pokemon: charizard),
    //       PokemonCard(pokemon: venusaur),
    //       PokemonCard(pokemon: blastoise),
    //     ],
    //   ),
    // );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Pokedex'),
    //     backgroundColor: Colors.white,
    //   ),
    //   body: pokemonProvider.pokemons.isEmpty
    //       ? Center(child: CircularProgressIndicator())
    //       : NotificationListener<ScrollNotification>(
    //           onNotification: (scrollNotification) {
    //             if (scrollNotification is ScrollEndNotification &&
    //                 scrollNotification.metrics.extentAfter == 0) {
    //               pokemonProvider.fetchMorePokemons();
    //             }
    //             return false;
    //           },
    //           child: ListView.builder(
    //             itemCount: pokemonProvider.pokemons.length,
    //             itemBuilder: (context, index) {
    //               return PokemonCard(pokemon: pokemonProvider.pokemons[index]);
    //             },
    //           ),
    //         ),
    // );
  }
}
