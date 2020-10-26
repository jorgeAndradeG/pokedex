import 'package:flutter/material.dart';
import 'package:pokedex/helpers/colorTheme.dart';
import 'package:pokedex/helpers/customWidget.dart';
import 'package:pokedex/models/pokemon_evolutions_chain_model.dart';
import 'package:pokedex/models/pokemon_evolutions_detail_model.dart';
import 'package:pokedex/models/pokemon_evolutions_foto_model.dart';
import 'package:pokedex/models/pokemon_evolutions_model.dart';
import 'package:pokedex/models/pokemon_evolutions_species_model.dart';
import 'package:pokedex/services/api_provider.dart';

class PokemonEvolutions extends StatelessWidget {
  final String nombrePokemon;
  PokemonEvolutions({this.nombrePokemon});
  ApiProvider apiProvider = ApiProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: FutureBuilder<PokemonEvolutionModel>(
        future: apiProvider.obtenerInfoEvoPokemon(nombrePokemon),
        builder: (BuildContext context,
            AsyncSnapshot<PokemonEvolutionModel> snapshot) {
          // print(snapshot.data.pokeEvolutionChain.chain.evolvesTo);
          /*  print(snapshot.data.pokeEvolutionChain.chain.evolvesTo[0].evolvesTo[0]
              .species.name);*/
          if (snapshot.hasData) {
            return Column(
              children: [
                Row(children: [
                  Text(
                    'Cadena Evolutiva',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    _crearRow(context, snapshot.data.pokeEvolutionChain,
                        snapshot.data.pokeDetail.id),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          } else {
            return Column(
              children: [CircularProgressIndicator()],
            );
          }
        },
      ),
    );
  }

  Widget _crearRow(BuildContext context, PokeEvolutionChain pokeChain, int id) {
    if (pokeChain.chain.evolvesTo.isEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text(
          'No posee cadena evolutiva',
          style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
              fontWeight: FontWeight.w700),
        ),
      );
    } else {
      print(pokeChain.chain.evolvesTo[0].species.name);
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      FutureBuilder<String>(
                          future: apiProvider.obtenerFotoEvoPokemon(
                              pokeChain.chain.species.name),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                  child: Column(children: [
                                Row(children: [
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Positioned(
                                              child: Image.asset(
                                            'assets/images/pokeball.png',
                                            height: getDimention(context, 100),
                                            color: Colors.black12,
                                          )),
                                          Positioned(
                                              child: Image.network(
                                            snapshot.data,
                                            height: getDimention(context, 100),
                                          )),
                                        ],
                                      )
                                    ],
                                  )
                                ])
                              ]));
                            } else {
                              return Column(
                                children: [CircularProgressIndicator()],
                              );
                            }
                          }),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Icon(Icons.keyboard_arrow_right),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '${pokeChain.chain.evolvesTo[0].evolutionDetails[0].minLevel}' ==
                                "null"
                            ? 'Sin\nNivel'
                            : 'Lvl. ${pokeChain.chain.evolvesTo[0].evolutionDetails[0].minLevel}',

                        //'Lvl ${chain.evolvesTo[0].evolutionDetails[0].minLevel}'
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      FutureBuilder<String>(
                          future: apiProvider.obtenerFotoEvoPokemon(
                              pokeChain.chain.evolvesTo[0].species.name),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                  child: Column(children: [
                                Row(children: [
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Positioned(
                                              child: Image.asset(
                                            'assets/images/pokeball.png',
                                            height: getDimention(context, 100),
                                            color: Colors.black12,
                                          )),
                                          Positioned(
                                              child: Image.network(
                                            snapshot.data,
                                            height: getDimention(context, 100),
                                          )),
                                        ],
                                      )
                                    ],
                                  )
                                ])
                              ]));
                            } else {
                              return Column(
                                children: [CircularProgressIndicator()],
                              );
                            }
                          }),
                    ],
                  ),
                ],
              ),
              SizedBox(height: getDimention(context, 50)),
              _segundaRow(context, pokeChain.chain.evolvesTo,
                  pokeChain.chain.evolvesTo[0].species.name),
            ],
          ),
        ),
      );
    }
  }

  _segundaRow(BuildContext context, List<EvolvesTo> evolvesTo, String name) {
    if (evolvesTo[0].evolvesTo.isEmpty) {
      return Column();
    } else {
      return Container(
        child: Row(
          children: [
            Column(
              children: [
                FutureBuilder<String>(
                    future: apiProvider
                        .obtenerFotoEvoPokemon(evolvesTo[0].species.name),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            child: Column(children: [
                          Row(children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                        child: Image.asset(
                                      'assets/images/pokeball.png',
                                      height: getDimention(context, 100),
                                      color: Colors.black12,
                                    )),
                                    Positioned(
                                        child: Image.network(
                                      snapshot.data,
                                      height: getDimention(context, 100),
                                    )),
                                  ],
                                )
                              ],
                            )
                          ])
                        ]));
                      } else {
                        return Column(
                          children: [CircularProgressIndicator()],
                        );
                      }
                    }),
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Column(
              children: [
                Icon(Icons.keyboard_arrow_right),
                SizedBox(
                  height: 7,
                ),
                Text(
                  '${evolvesTo[0].evolvesTo[0].evolutionDetails[0].minLevel}' ==
                          "null"
                      ? 'Sin\nNivel'
                      : 'Lvl. ${evolvesTo[0].evolvesTo[0].evolutionDetails[0].minLevel}',

                  //'Lvl ${chain.evolvesTo[0].evolutionDetails[0].minLevel}'
                ),
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Column(
              children: [
                FutureBuilder<String>(
                    future: apiProvider.obtenerFotoEvoPokemon(
                        evolvesTo[0].evolvesTo[0].species.name),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            child: Column(children: [
                          Row(children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                        child: Image.asset(
                                      'assets/images/pokeball.png',
                                      height: getDimention(context, 100),
                                      color: Colors.black12,
                                    )),
                                    Positioned(
                                        child: Image.network(
                                      snapshot.data,
                                      height: getDimention(context, 100),
                                    )),
                                  ],
                                )
                              ],
                            )
                          ])
                        ]));
                      } else {
                        return Column(
                          children: [CircularProgressIndicator()],
                        );
                      }
                    }),
              ],
            ),
          ],
        ),
      );
    }
  }

  /* Widget _segundaRow(BuildContext context, List<EvolvesTo> chain) {
    if (pokeChain.chain.evolvesTo.isEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text(
          'No posee cadena evolutiva',
          style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
              fontWeight: FontWeight.w700),
        ),
      );
    } else {
      return Container(
        child: Row(children: [
          Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Image.asset(
                    'assets/images/pokeball.png',
                    height: getDimention(context, 100),
                    color: Colors.black12,
                  )),
                ],
              )
            ],
          ),
          SizedBox(
            width: 60,
          ),
          Column(
            children: [
              Icon(Icons.keyboard_arrow_right),
              SizedBox(
                height: 7,
              ),
              Text(
                '${chain[0].evolvesTo[0].evolutionDetails[0].minLevel}' ==
                        "null"
                    ? 'Sin\nNivel'
                    : 'Lvl. ${chain[0].evolvesTo[0].evolutionDetails[0].minLevel}',

                //'Lvl ${chain.evolvesTo[0].evolutionDetails[0].minLevel}'
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Image.asset(
                    'assets/images/pokeball.png',
                    height: getDimention(context, 100),
                    color: Colors.black12,
                  )),
                ],
              )
            ],
          ),
        ]),
      );
    }
  }*/
}
