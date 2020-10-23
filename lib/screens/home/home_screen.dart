import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_list_model.dart';
import 'package:pokedex/screens/home/componentes/pokemon_card.dart';
import 'package:pokedex/services/api_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ApiProvider apiProvider = ApiProvider();
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          right: -20,
          top: -20,
          child: RotationTransition(
            turns: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(controller),
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 250,
              color: Color(0xffe3e3e).withAlpha(100),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 100,
                  flexibleSpace: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                FutureBuilder<List<PokemonListModel>>(
                  future: apiProvider.obtenerListaPokemon(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PokemonListModel>> snapshot) {
                    if (snapshot.hasData) {
                      return SliverGrid.count(
                          childAspectRatio: 1.4,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: snapshot.data
                              .map((poke) => PokemonCard(
                                    pokemon: poke,
                                  ))
                              .toList());
                    } else if (snapshot.hasError) {
                      return SliverGrid.count(
                        crossAxisCount: 1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        children: [
                          Center(
                            child: Text('Error de Servidor'),
                          )
                        ],
                      );
                    } else {
                      return SliverGrid.count(
                        crossAxisCount: 1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        children: [
                          Center(
                            child: CircularProgressIndicator(),
                          )
                        ],
                      );
                    }
                  },
                )
              ],
            ))
      ],
    ));
  }
}
