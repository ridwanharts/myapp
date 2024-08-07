import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../screens/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(
                  pokemon.backgroundUrl,
                ),
                alignment: Alignment.centerRight),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //padding: EdgeInsets.only(top: 2, bottom: 2, left: 2),
                    child: (Image.network(
                      pokemon.imageUrl,
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    )),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          pokemon.name.toUpperCase(),
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.oswald(
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        pokemon.species!.names
                                            .elementAt(1)
                                            .toUpperCase(),
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.oswald(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        pokemon.species!.names
                                            .elementAt(0)
                                            .toUpperCase(),
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.oswald(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Text(
                                          "#" + pokemon.id.toString(),
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.oswald(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pokemon.types.map((type) {
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: getColorFromType(type),
                      ),
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            type.toUpperCase(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.0),
                          getIconTypeFromType(type).contains("https")
                              ? Image.network(
                                  getIconTypeFromType(type),
                                  height: 14,
                                  width: 14,
                                )
                              : Image.asset(
                                  getIconTypeFromType(type),
                                  height: 14,
                                  width: 14,
                                ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getColorFromType(String type) {
    switch (type) {
      case 'fire':
        return Colors.redAccent;
      case 'water':
        return Colors.blueAccent;
      case 'grass':
        return Colors.green;
      case 'bug':
        return const Color(0xFFADC501);
      case 'poison':
        return Colors.purple;
      case 'fairy':
        return Colors.pinkAccent;
      case 'electric':
        return Colors.orange;
      case 'ground':
        return Colors.brown;
      case 'fighting':
        return Colors.red;
      case 'psychic':
        return const Color(0xFFC7C701);
      case 'dark':
        return Colors.indigo;
      case 'ghost':
        return Colors.purple;
      case 'ice':
        return Colors.blueGrey;
      case 'dragon':
        return const Color(0xFF770000);
      case 'rock':
        return const Color(0xFF5B2911);
      default:
        return Colors.grey;
    }
  }

  String getIconTypeFromType(String type) {
    switch (type) {
      case 'fire':
        return "https://archives.bulbagarden.net/media/upload/thumb/5/5e/Fire_icon.png/40px-Fire_icon.png";
      //return "https://archives.bulbagarden.net/media/upload/thumb/5/5e/Fire_icon.png/40px-Fire_icon.png";
      case 'water':
        //return "https://archives.bulbagarden.net/media/upload/thumb/7/7f/Water_icon.png/40px-Water_icon.png";
        return "assets/Water_Type_Icon.png";
      case 'grass':
        return "https://archives.bulbagarden.net/media/upload/thumb/c/cb/Grass_icon.png/40px-Grass_icon.png";
      //return "https://archives.bulbagarden.net/media/upload/e/ef/Grass_icon_Sleep.png";
      case 'flying':
        return "https://archives.bulbagarden.net/media/upload/thumb/f/f0/Flying_icon.png/40px-Flying_icon.png";
      case 'bug':
        return "https://archives.bulbagarden.net/media/upload/thumb/7/79/Bug_icon.png/40px-Bug_icon.png";
      case 'poison':
        //return "https://archives.bulbagarden.net/media/upload/thumb/8/84/Poison_icon.png/40px-Poison_icon.png";
        return "assets/Poison_Type_Icon.png";
      case 'fairy':
        //return "https://archives.bulbagarden.net/media/upload/thumb/5/5a/Fairy_icon.png/40px-Fairy_icon.png";
        return "assets/Fairy_Type_Icon.png";
      case 'electric':
        //return "https://archives.bulbagarden.net/media/upload/thumb/a/af/Electric_icon.png/40px-Electric_icon.png";
        return "assets/Electric_Type_Icon.png";
      case 'ground':
        //return "https://archives.bulbagarden.net/media/upload/thumb/5/58/Ground_icon.png/40px-Ground_icon.png";
        return "assets/Ground_Type_Icon.png";
      case 'fighting':
        //return "https://archives.bulbagarden.net/media/upload/thumb/7/7d/Fighting_icon.png/40px-Fighting_icon.png";
        return "assets/Fighting_Type_Icon.png";
      case 'psychic':
        //return "https://archives.bulbagarden.net/media/upload/thumb/a/a6/Psychic_icon.png/40px-Psychic_icon.png";
        return "assets/Psychic_Type_Icon.png";
      case 'dark':
        //return "https://archives.bulbagarden.net/media/upload/thumb/3/33/Dark_icon.png/40px-Dark_icon.png";
        return "assets/Dark_Type_Icon.png";
      case 'dragon':
        return "https://archives.bulbagarden.net/media/upload/thumb/9/91/Dragon_icon.png/40px-Dragon_icon.png";
      case 'ghost':
        return "https://archives.bulbagarden.net/media/upload/thumb/8/82/Ghost_icon.png/40px-Ghost_icon.png";
      case 'ice':
        //return "https://archives.bulbagarden.net/media/upload/thumb/8/83/Ice_icon.png/40px-Ice_icon.png";
        return "assets/Ice_Type_Icon.png";
      case 'steel':
        //return "https://archives.bulbagarden.net/media/upload/thumb/b/b8/Steel_icon.png/40px-Steel_icon.png";
        return "assets/Steel_Type_Icon.png";
      case 'rock':
        //return "https://archives.bulbagarden.net/media/upload/thumb/f/ff/Rock_icon.png/40px-Rock_icon.png";
        return "assets/Rock_Type_Icon.png";
      default:
        //return "https://archives.bulbagarden.net/media/upload/thumb/a/ae/Normal_icon.png/40px-Normal_icon.png";
        return "assets/Normal_Type_Icon.png";
    }
  }
}
