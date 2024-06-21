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
            color: getColorFromType(pokemon.type),
            borderRadius: BorderRadius.circular(4),
          ),
          //padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
          child: Row(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      child: (Image.network(
                        pokemon.imageUrl,
                        height: 50,
                        width: 50,
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          Text(
                            pokemon.name.toUpperCase(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      getIconTypeFromType(pokemon.type),
                      //color: Colors.black.withOpacity(0.5), // Set 50% transparency
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
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
        return Colors.greenAccent;
      case 'bug':
        return Colors.yellow;
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
        return Colors.yellowAccent;
      case 'dark':
        return Colors.indigo;
      case 'ghost':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String getIconTypeFromType(String type) {
    switch (type) {
      case 'fire':
        //return "https://archives.bulbagarden.net/media/upload/thumb/5/5e/Fire_icon.png/40px-Fire_icon.png";
        return "https://archives.bulbagarden.net/media/upload/b/b3/Fire_icon_Sleep.png";
      case 'water':
        return "https://archives.bulbagarden.net/media/upload/thumb/7/7f/Water_icon.png/40px-Water_icon.png";
      case 'grass':
        //return "https://archives.bulbagarden.net/media/upload/thumb/c/cb/Grass_icon.png/40px-Grass_icon.png";
        return "https://archives.bulbagarden.net/media/upload/e/ef/Grass_icon_Sleep.png";
      case 'flying':
        return "https://archives.bulbagarden.net/media/upload/thumb/f/f0/Flying_icon.png/40px-Flying_icon.png";
      case 'bug':
        return "https://archives.bulbagarden.net/media/upload/thumb/7/79/Bug_icon.png/40px-Bug_icon.png";
      case 'poison':
        return "https://archives.bulbagarden.net/media/upload/thumb/8/84/Poison_icon.png/40px-Poison_icon.png";
      case 'fairy':
        return "https://archives.bulbagarden.net/media/upload/thumb/5/5a/Fairy_icon.png/40px-Fairy_icon.png";
      case 'electric':
        return "https://archives.bulbagarden.net/media/upload/thumb/a/af/Electric_icon.png/40px-Electric_icon.png";
      case 'ground':
        return "https://archives.bulbagarden.net/media/upload/thumb/5/58/Ground_icon.png/40px-Ground_icon.png";
      case 'fighting':
        return "https://archives.bulbagarden.net/media/upload/thumb/7/7d/Fighting_icon.png/40px-Fighting_icon.png";
      case 'psychic':
        return "https://archives.bulbagarden.net/media/upload/thumb/a/a6/Psychic_icon.png/40px-Psychic_icon.png";
      case 'dark':
        return "https://archives.bulbagarden.net/media/upload/thumb/3/33/Dark_icon.png/40px-Dark_icon.png";
      case 'dragon':
        return "https://archives.bulbagarden.net/media/upload/thumb/9/91/Dragon_icon.png/40px-Dragon_icon.png";
      case 'ghost':
        return "https://archives.bulbagarden.net/media/upload/thumb/8/82/Ghost_icon.png/40px-Ghost_icon.png";
      case 'ice':
        return "https://archives.bulbagarden.net/media/upload/thumb/8/83/Ice_icon.png/40px-Ice_icon.png";
      case 'steel':
        return "https://archives.bulbagarden.net/media/upload/thumb/b/b8/Steel_icon.png/40px-Steel_icon.png";
      case 'rock':
        return "https://archives.bulbagarden.net/media/upload/thumb/f/ff/Rock_icon.png/40px-Rock_icon.png";
      default:
        return "https://archives.bulbagarden.net/media/upload/thumb/a/ae/Normal_icon.png/40px-Normal_icon.png";
    }
  }
}
