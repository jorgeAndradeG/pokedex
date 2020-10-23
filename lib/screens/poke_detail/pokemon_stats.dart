import 'package:flutter/material.dart';
import 'package:pokedex/helpers/colorTheme.dart';
import 'package:pokedex/helpers/customWidget.dart';
import 'package:pokedex/models/pokemon_stats_detail_model.dart';
import 'package:pokedex/models/pokemon_stats_model.dart';
import 'package:pokedex/services/api_provider.dart';

class PokemonStats extends StatelessWidget {
  final String nombrePokemon;
  PokemonStats({
    this.nombrePokemon,
  });
  final ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      width: fullWidth(context),
      child: FutureBuilder<PokemonStatsModel>(
        future: apiProvider.obtenerInfoStatsPokemon(nombrePokemon),
        builder:
            (BuildContext context, AsyncSnapshot<PokemonStatsModel> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                crearStats(snapshot.data.pokeStatDetail.stats, context),
                SizedBox(
                  height: 10,
                ),
                crearAbilities(
                  snapshot.data.pokeStatDetail.abilities,
                  context,
                ),
                crearPropiedad(
                  'Habitat',
                  snapshot.data.pokeStatSpecies.habitat.name,
                  context,
                ),
                crearPropiedad(
                  'Forma',
                  snapshot.data.pokeStatSpecies.shape.name,
                  context,
                ),
                crearPropiedad(
                  'Visto En',
                  snapshot.data.pokeStatSpecies.palParkEncounters[0].area.name,
                  context,
                ),
                crearPropiedad(
                  'Color',
                  snapshot.data.pokeStatSpecies.color.name,
                  context,
                ),
                crearPropiedad(
                  'Ratio Captura',
                  '${snapshot.data.pokeStatSpecies.captureRate}',
                  context,
                ),
              ],
            );
          } else {
            return Column(
              children: [
                CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget crearStats(List<Stats> stats, BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: stats
              .map((stat) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              stat.stat.name,
                              style: TextStyle(
                                  fontSize: getFontSize(context, 15),
                                  color: Colors.black54),
                            ),
                          ),
                          Text(
                            '${stat.baseStat}',
                            style: TextStyle(
                                fontSize: getFontSize(context, 15),
                                color: Colors.black),
                          )
                        ],
                      ),
                      crearLinearStatIndicator(stat.baseStat, stat.stat.name)
                    ],
                  )))
              .toList(),
        ));
  }

  Widget crearLinearStatIndicator(int baseStat, String name) {
    return LinearProgressIndicator(
      value: baseStat / 160,
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(getStatIndicatorColor(name)),
    );
  }

  Color getStatIndicatorColor(String statName) {
    Color color = Colors.black;
    switch (statName) {
      case 'hp':
        color = setprimaryColor('Ground');
        break;
      case 'attack':
        color = setprimaryColor('Ice');
        break;
      case 'defense':
        color = setprimaryColor('Bug');
        break;
      case 'special-attack':
        color = setprimaryColor('Poison');
        break;
      case 'specia-defense':
        color = setprimaryColor('Grass');
        break;
      case 'speed':
        color = setprimaryColor('Fire');
        break;
    }
    return color;
  }

  Widget crearAbilities(List<Abilities> abilities, BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: fullWidth(context),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                'Habilidades',
                style: TextStyle(
                    fontSize: getFontSize(context, 14),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
                flex: 2,
                child: Wrap(
                  children: abilities
                      .map((ability) => Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(ability.ability.name,
                              style: TextStyle(
                                fontSize: getFontSize(context, 14),
                                color: Colors.black87,
                              ))))
                      .toList(),
                ))
          ],
        ));
  }

  Widget crearPropiedad(String titulo, String valor, BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: getFontSize(context, 14),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                valor,
                style: TextStyle(
                  fontSize: getFontSize(context, 14),
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ));
  }
}
