import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    _pokemons = await _dbHelper.fetchPokemons();
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
      for (var item in data['results']) {
        final detailResponse = await http.get(Uri.parse(item['url']));
        final detailData = json.decode(detailResponse.body);
        final pokemon = Pokemon.fromJson(detailData);
        _pokemons.add(pokemon);
        _dbHelper.insertPokemon(pokemon);
      }
      _page++;
      _filteredPokemons = _pokemons;
      notifyListeners();
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

  Future<PokemonSpecies?> fetchSpeciesData(int pokemonId) async {
    if (_speciesCache.containsKey(pokemonId)) {
      return _speciesCache[pokemonId]; // Return from cache if available
    }

    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonId'));
    if (response.statusCode == 200) {
      final species = PokemonSpecies.fromJson(jsonDecode(response.body));
      _speciesCache[pokemonId] = species; // Cache the species data
      return species;
    } else {
      return null;
    }
  }
}
