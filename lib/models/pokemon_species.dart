class PokemonSpecies {
  final int id;
  final List<String> names;

  PokemonSpecies({
    required this.id,
    required this.names,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {
    List<String> names = (json['names'] as List)
        .map((typeInfo) => typeInfo['name'] as String)
        .toList();

    return PokemonSpecies(
      id: json['id'],
      names: names,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'names': names,
    };
  }

  factory PokemonSpecies.fromMap(Map<String, dynamic> map) {
    return PokemonSpecies(
      id: map['id'],
      names: List<String>.from(map['names']),
    );
  }
}
