import 'package:flutter/material.dart';
import 'package:pokedex/helpers/colorTheme.dart';
import 'package:pokedex/models/pokemon_moves_detail_model.dart';
import 'package:pokedex/models/pokemon_moves_type_model.dart';
import 'package:pokedex/services/api_provider.dart';

class PokemonMoves extends StatelessWidget {
  final String nombrePoke;
  ApiProvider apiProvider = ApiProvider();
  PokemonMoves({this.nombrePoke});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<PokeMovesDetail>(
      future: apiProvider.obtenerMovesPokemon(nombrePoke),
      builder: (BuildContext context, AsyncSnapshot<PokeMovesDetail> snapshot) {
        if (snapshot.hasData) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
              child: _listaChips(
                context,
                snapshot.data.moves,
                snapshot.data.types[0].type.name,
              ));
        } else {
          return Column(
            children: [CircularProgressIndicator()],
          );
        }
      },
    ));
  }

  Widget _listaChips(BuildContext context, List<Moves> moves, String tipoPoke) {
    List<Widget> listaMovimientos = moves
        .map((move) => Container(
            child: FutureBuilder<PokeMovesType>(
                future: apiProvider.obtenerTipoMovimiento(move.move.url),
                builder: (context, AsyncSnapshot<PokeMovesType> snapshot2) {
                  if (snapshot2.hasData) {
                    return (Chip(
                      label: Text(move.move.name,
                          style: TextStyle(color: Colors.white)),
                      backgroundColor:
                          setSecondaryColor(snapshot2.data.type.name),
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                      elevation: 3.5,
                      shadowColor: setSecondaryColor(snapshot2.data.type.name),
                    ));
                  } else {
                    return Text('');
                  }
                })))
        .toList();

    return ListView(
      children: [
        Wrap(
          spacing: 3,
          children: listaMovimientos,
          alignment: WrapAlignment.spaceBetween,
        )
      ],
    );
  }
  /*child:  snapshot.data.moves.map((move) => Container(
                            child: Text(move.move.name,
                                style:
                                    TextStyle(backgroundColor: Colors.yellow)),
                          ))
                      .toList()*/
}
