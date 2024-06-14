class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String type;
  final String backgroundUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.backgroundUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      type: json['types'][0]['type']['name'],
      backgroundUrl: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'type': type,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      type: map['type'],
      backgroundUrl: map['imageUrl'],
    );
  }
}
