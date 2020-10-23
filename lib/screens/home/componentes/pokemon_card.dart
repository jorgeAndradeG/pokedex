import 'package:flutter/material.dart';
import 'package:pokedex/helpers/colorTheme.dart';
import 'package:pokedex/models/pokemon_list_model.dart';
import 'package:pokedex/screens/poke_detail/poke_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  final PokemonListModel pokemon;
  PokemonCard({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PokemonDetailScreen(
                    pokemon: pokemon,
                  ))),
      child: Card(
          color: setprimaryColor(pokemon.type1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  '#${pokemon.nDex}',
                  style: TextStyle(
                      color: setSecondaryColor(pokemon.type1),
                      fontSize: 12,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                bottom: 0,
                right: -30,
                height: 100,
                child: Image.asset('assets/images/pokeball.png',
                    color: setSecondaryColor(pokemon.type1)),
              ),
              Positioned(
                  bottom: 5,
                  right: 5,
                  child: Hero(
                    tag: pokemon.orderID,
                    child: Image.network(
                      '${pokemon.image}',
                      height: 70,
                    ),
                  )),
              Positioned(
                  top: 20,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text('${pokemon.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _crearPokeTipo(context, pokemon.type1,
                          setSecondaryColor(pokemon.type1)),
                      SizedBox(
                        height: 5,
                      ),
                      _crearPokeTipo(context, pokemon.type2,
                          setSecondaryColor(pokemon.type2))
                    ],
                  ))
            ],
          )),
    );
  }

  Widget _crearPokeTipo(BuildContext context, String tipo, Color color) {
    if (tipo == null || tipo.isEmpty) {
      return SizedBox();
    } else {
      return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 1,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(tipo,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              )));
    }
  }
}
