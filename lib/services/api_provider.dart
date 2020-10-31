import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_about_detail_model.dart';
import 'package:pokedex/models/pokemon_about_location_model.dart';
import 'package:pokedex/models/pokemon_about_model.dart';
import 'package:pokedex/models/pokemon_about_species_model.dart';
import 'package:pokedex/models/pokemon_detail_genera_model.dart';
import 'package:pokedex/models/pokemon_evolutions_chain_model.dart';
import 'package:pokedex/models/pokemon_evolutions_detail_model.dart';
import 'package:pokedex/models/pokemon_evolutions_foto_model.dart';
import 'package:pokedex/models/pokemon_evolutions_model.dart';
import 'package:pokedex/models/pokemon_evolutions_species_model.dart';
import 'package:pokedex/models/pokemon_list_model.dart';
import 'package:pokedex/models/pokemon_moves_detail_model.dart';
import 'package:pokedex/models/pokemon_moves_type_model.dart';
import 'package:pokedex/models/pokemon_stats_detail_model.dart';
import 'package:pokedex/models/pokemon_stats_model.dart';
import 'package:pokedex/models/pokemon_stats_species_model.dart';

class ApiProvider {
  Dio dio = Dio();

  Future<List<PokemonListModel>> obtenerListaPokemon() async {
    List<PokemonListModel> lista = [];
    try {
      Response resp =
          await dio.get('https://pokedexvuejs.herokuapp.com/pokedexdb');
      final pokemones = PokemonListResponse.fromJsonList(resp.data);
      lista = pokemones.items;
    } catch (e) {}
    return lista;
  }

  Future<PokemonAboutModel> obtenerInfoAboutPokemon(String nombrePoke) async {
    var pokeAbout = PokemonAboutModel();
    try {
      Response respA =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      final pokeDetail = PokeAboutDetail.fromJson(respA.data);
      Response respB = await dio
          .get('https://pokeapi.co/api/v2/pokemon/${pokeDetail.id}/encounters');
      final pokeListLocation =
          PokemonAboutLocationListModel.fromJsonList(respB.data);
      Response respC = await dio
          .get('https://pokeapi.co/api/v2/pokemon-species/${pokeDetail.id}');
      final pokeSpecies = PokeAboutSpecies.fromJson(respC.data);
      pokeAbout = PokemonAboutModel(
        pokeDetail: pokeDetail,
        pokeLocations: pokeListLocation.items,
        pokeSpecies: pokeSpecies,
      );
    } catch (e) {}
    return pokeAbout;
  }

  Future<PokemonStatsModel> obtenerInfoStatsPokemon(String nombrePoke) async {
    var pokeStats = PokemonStatsModel();
    try {
      Response respA =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      final pokeStatDetail = PokeStatsDetail.fromJson(respA.data);

      Response respB = await dio.get(
          'https://pokeapi.co/api/v2/pokemon-species/${pokeStatDetail.id}');
      final pokeStatSpecies = PokeStatsSpecies.fromJson(respB.data);

      pokeStats = PokemonStatsModel(
          pokeStatDetail: pokeStatDetail, pokeStatSpecies: pokeStatSpecies);
    } catch (e) {}

    return pokeStats;
  }

  Future<PokemonEvolutionModel> obtenerInfoEvoPokemon(String nombrePoke) async {
    var pokeEvolution = PokemonEvolutionModel();
    try {
      Response respA =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      final pokeDetail = PokeEvolutionDetail.fromJson(respA.data);
      Response respB = await dio
          .get('https://pokeapi.co/api/v2/pokemon-species/${pokeDetail.id}');
      final pokeEvolutionSpecies = PokeEvolutionSpecies.fromJson(respB.data);
      Response respC =
          await dio.get('${pokeEvolutionSpecies.evolutionChain.url}');
      final pokeEvolutionChain = PokeEvolutionChain.fromJson(respC.data);

      pokeEvolution = PokemonEvolutionModel(
        pokeDetail: pokeDetail,
        pokeEvolutionSpecies: pokeEvolutionSpecies,
        pokeEvolutionChain: pokeEvolutionChain,
      );
    } catch (e) {}
    return pokeEvolution;
  }

  Future<String> obtenerFotoEvoPokemon(String nombrePoke) async {
    String pokeFoto;
    // final pokeFoto = PokeEvolutionFotoModel.fromJson(respA.data[idPoke - 1]);
    // pokeEvolutionFoto = pokeFoto;
    List<PokemonListModel> lista = [];
    try {
      Response resp =
          await dio.get('https://pokedexvuejs.herokuapp.com/pokedexdb');
      final pokemones = PokemonListResponse.fromJsonList(resp.data);
      lista = pokemones.items;
      for (var i = 0; i < lista.length; i++) {
        if (lista[i].name.toLowerCase() == nombrePoke) {
          pokeFoto = lista[i].image;
          i = lista.length;
        }
      }
    } catch (e) {}
    return pokeFoto;
  }

  Future<PokeMovesDetail> obtenerMovesPokemon(String nombrePoke) async {
    var pokeMovesDetail = PokeMovesDetail();
    try {
      Response respA =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      pokeMovesDetail = PokeMovesDetail.fromJson(respA.data);
    } catch (e) {}
    return pokeMovesDetail;
  }

  Future<PokeMovesType> obtenerTipoMovimiento(String urlAtk) async {
    var pokeTypeModel = PokeMovesType();
    try {
      Response respA = await dio.get(urlAtk);
      pokeTypeModel = PokeMovesType.fromJson(respA.data);
    } catch (e) {}
    return pokeTypeModel;
  }

  Future<PokeDetailGenera> obtenerTextGenera(String nombrePoke) async {
    var pokeTextGenera = PokeDetailGenera();
    try {
      Response respA =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$nombrePoke');
      final pokeDetail = PokeAboutDetail.fromJson(respA.data);
      Response respB = await dio
          .get('https://pokeapi.co/api/v2/pokemon-species/${pokeDetail.id}');
      pokeTextGenera = PokeDetailGenera.fromJson(respB.data);
    } catch (e) {}
    return pokeTextGenera;
  }
}
