import 'package:pokedex/models/pokemon_about_detail_model.dart';
import 'package:pokedex/models/pokemon_about_location_model.dart';
import 'package:pokedex/models/pokemon_about_species_model.dart';

class PokemonAboutModel {
  PokeAboutDetail pokeDetail;
  PokeAboutSpecies pokeSpecies;
  List<PokeAboutLocation> pokeLocations;

  PokemonAboutModel({
    this.pokeDetail,
    this.pokeSpecies,
    this.pokeLocations,
  });
}
