import 'package:pokedex/models/pokemon_stats_detail_model.dart';
import 'package:pokedex/models/pokemon_stats_species_model.dart';

class PokemonStatsModel {
  PokeStatsDetail pokeStatDetail;
  PokeStatsSpecies pokeStatSpecies;

  PokemonStatsModel({
    this.pokeStatDetail,
    this.pokeStatSpecies,
  });
}
