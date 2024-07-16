import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import '../models/pokemon.dart';
import '../db_helper.dart';
import '../models/pokemon_species.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _pokemons = [];
  List<Pokemon> _filteredPokemons = [];
  final Map<int, PokemonSpecies> _speciesCache = {};
  int _page = 0;
  final int _limit = 10;
  final DBHelper _dbHelper = DBHelper();

  List<Pokemon> get pokemons => _pokemons;
  List<Pokemon> get filteredPokemons => _filteredPokemons;

  PokemonProvider() {
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    //_pokemons = await _dbHelper.fetchPokemons();
    _filteredPokemons = _pokemons;
    if (_pokemons.isEmpty) {
      fetchMorePokemons();
    } else {
      notifyListeners();
    }
  }

  Future<void> fetchMorePokemons() async {
    final url =
        'https://pokeapi.co/api/v2/pokemon?offset=${_page * _limit}&limit=$_limit';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Future<void>> fetchDetailsTasks = [];

      for (var item in data['results']) {
        print('item: ${item}');
        fetchDetailsTasks.add(fetchPokemonDetails(item['url']));
      }

      await Future.wait(fetchDetailsTasks);
      _page++;
      _filteredPokemons = _pokemons;
      print('_page: ${_page}');
      notifyListeners();
    } else {
      // Handle error
      print('Failed to fetch Pokémon list: ${response.statusCode}');
    }
  }

  Future<void> fetchPokemonDetails(String url) async {
    final detailResponse = await http.get(Uri.parse(url));
    if (detailResponse.statusCode == 200) {
      final detailData = json.decode(detailResponse.body);
      var pokemon = Pokemon.fromJson(detailData);
      pokemon.species = await fetchSpeciesData(pokemon.id);
      double lat = 0.0;
      double lon = 0.0;
      var rng = Random();
      var randomPoint = rng.nextInt(100) / 1000;
      if (pokemon.types.contains("grass")) {
        // Place grass Pokémon in Indonesia
        lat = -2.5 + (randomPoint); // Example coordinates in Indonesia
        lon = 109.9 + (randomPoint);
      } else if (pokemon.types.contains("water")) {
        // Place water Pokémon in Singapore
        lat = 1.35 + (randomPoint); // Example coordinates in Singapore
        lon = 103.82 + (randomPoint);
      } else if (pokemon.types.contains("fire")) {
        // Place water Pokémon in Singapore
        lat = -7 + (randomPoint); // Example coordinates in Singapore
        lon = 109.92 + (randomPoint);
      } else {
        // Skip other types
      }
      pokemon.marker = Marker(
        point: LatLng(lat, lon),
        width: 80.0,
        height: 80.0,
        child: Column(
          children: [
            Image.network(
              pokemon.imageUrl,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
            Text(pokemon.name),
          ],
        ),
      );
      _pokemons.add(pokemon);
      _pokemons.sort((a, b) => a.id.compareTo(b.id));
      //_dbHelper.insertPokemon(pokemon);
    } else {
      // Handle error
      print('Failed to fetch Pokémon details: ${detailResponse.statusCode}');
    }
  }

  Future<PokemonSpecies?> fetchSpeciesData(int pokemonId) async {
    if (_speciesCache.containsKey(pokemonId)) {
      return _speciesCache[pokemonId];
    }

    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonId'));

    if (response.statusCode == 200) {
      final species = PokemonSpecies.fromJson(jsonDecode(response.body));
      _speciesCache[pokemonId] = species;
      return species;
    } else {
      // Handle error
      print('Failed to fetch Pokémon species: ${response.statusCode}');
      return null;
    }
  }

  void filterPokemons(String search, String type) {
    if (type == "All" && search.isEmpty) {
      _filteredPokemons = _pokemons;
    } else {
      _filteredPokemons = _pokemons.where((pokemon) {
        final matchesType = type == "All" || pokemon.types == type;
        final matchesSearch = pokemon.name.contains(search);
        return matchesType && matchesSearch;
      }).toList();
    }
    notifyListeners();
  }
}
