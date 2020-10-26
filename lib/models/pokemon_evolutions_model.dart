import 'package:pokedex/models/pokemon_evolutions_chain_model.dart';
import 'package:pokedex/models/pokemon_evolutions_detail_model.dart';
import 'package:pokedex/models/pokemon_evolutions_foto_model.dart';
import 'package:pokedex/models/pokemon_evolutions_species_model.dart';

class PokemonEvolutionModel {
  PokeEvolutionDetail pokeDetail;
  PokeEvolutionSpecies pokeEvolutionSpecies;
  PokeEvolutionChain pokeEvolutionChain;

  PokemonEvolutionModel({
    this.pokeDetail,
    this.pokeEvolutionSpecies,
    this.pokeEvolutionChain,
  });
}
