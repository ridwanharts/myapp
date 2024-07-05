import 'package:myapp/models/pokemon_species.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final String backgroundUrl;
  PokemonSpecies? species;

  Pokemon(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.types,
      required this.backgroundUrl,
      this.species});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> types = (json['types'] as List)
        .map((typeInfo) => typeInfo['type']['name'] as String)
        .toList();

    return Pokemon(
        id: json['id'],
        name: json['name'],
        imageUrl: json['sprites']['front_default'],
        types: types,
        backgroundUrl: json['sprites']['back_default']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'type': types,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      types: List<String>.from(map['types']),
      backgroundUrl: map['imageUrl'],
    );
  }
}
