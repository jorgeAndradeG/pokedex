import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_evolutions_model.dart';
import 'package:pokedex/services/api_provider.dart';

class PokemonEvolutions extends StatelessWidget {
  final String nombrePokemon;
  PokemonEvolutions({this.nombrePokemon});
  ApiProvider apiProvider = ApiProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: FutureBuilder<PokemonEvolutionModel>(
        future: apiProvider.obtenerInfoEvoPokemon(nombrePokemon),
        builder: (BuildContext context,
            AsyncSnapshot<PokemonEvolutionModel> snapshot) {
          if (snapshot.hasData) {
            return Text('Ok');
          } else {
            return (Text('Noo'));
          }
        },
      ),
    );
  }
}
