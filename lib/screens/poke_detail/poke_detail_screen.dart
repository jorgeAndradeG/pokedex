import 'package:flutter/material.dart';
import 'package:pokedex/helpers/colorTheme.dart';
import 'package:pokedex/helpers/customWidget.dart';
import 'package:pokedex/models/pokemon_list_model.dart';
import 'package:pokedex/screens/poke_detail/pokemon_about.dart';
import 'package:pokedex/screens/poke_detail/pokemon_evolutions.dart';
import 'package:pokedex/screens/poke_detail/pokemon_moves.dart';
import 'package:pokedex/screens/poke_detail/pokemon_stats.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonDetailScreen extends StatefulWidget {
  final PokemonListModel pokemon;
  PokemonDetailScreen({this.pokemon});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  double opacidad = 0;
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
      backgroundColor: setprimaryColor(widget.pokemon.type1),
      body: Stack(
        children: [
          _pokebolaRotandoArriba(),
          Positioned(
            left: 10,
            top: getDimention(context, 40),
            child: BackButton(
              color: Colors.white60,
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            width: fullWidth(context) - 40,
            child: _pokemonInfo(),
          ),
          Positioned(
              right: 50,
              left: 50,
              top: getDimention(context, 300),
              child: Align(
                alignment: Alignment.center,
                heightFactor: getDimention(context, 0.75),
                widthFactor: getDimention(context, 0.7),
                child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                    child: Image.asset('assets/images/pokeball.png',
                        color: setSecondaryColor(widget.pokemon.type1),
                        height: getDimention(context, 250))),
              )),
          SlidingUpPanel(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              minHeight: fullHeight(context) - getDimention(context, 420),
              maxHeight: fullHeight(context) - getDimention(context, 200),
              onPanelSlide: (slide) {
                setState(() {
                  opacidad = slide;
                });
              },
              panel: Container(
                width: fullWidth(context),
                padding: EdgeInsets.only(
                  top: getDimention(context, 20),
                ),
                child: DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: TabBar(
                        labelPadding: EdgeInsets.symmetric(horizontal: 5),
                        indicatorColor: setprimaryColor(widget.pokemon.type1),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black54,
                        indicatorPadding: EdgeInsets.symmetric(
                            horizontal: getDimention(context, 5)),
                        tabs: [
                          Tab(
                              child: Text('Sobre',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getFontSize(context, 12)))),
                          Tab(
                              child: Text('Stats',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getFontSize(context, 12)))),
                          Tab(
                              child: Text('Evoluciones',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getFontSize(context, 12)))),
                          Tab(
                              child: Text('Movimientos',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: getFontSize(context, 12)))),
                        ],
                      ),
                      body: TabBarView(
                        children: [
                          PokemonAbout(
                            nombrePokemon: widget.pokemon.name.toLowerCase(),
                          ),
                          PokemonStats(
                            nombrePokemon: widget.pokemon.name.toLowerCase(),
                          ),
                          PokemonEvolutions(),
                          PokemonMoves(),
                        ],
                      ),
                    )),
              )),
          Positioned(
            top: getDimention(context, 260),
            height: getDimention(context, 200 * (1 - opacidad)),
            width: MediaQuery.of(context).size.width,
            child: Opacity(
              opacity: 1 - opacidad,
              child: Hero(
                tag: widget.pokemon.orderID,
                child: Image(
                  image: customAdvanceNetworkImage(widget.pokemon.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pokebolaRotandoArriba() {
    return Positioned(
      right: -20,
      top: -20,
      child: RotationTransition(
        turns: Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(controller),
        child: Opacity(
          opacity: opacidad,
          child: Image.asset(
            'assets/images/pokeball.png',
            height: 250,
            color: Color(0xffe3e3e).withAlpha(100),
          ),
        ),
      ),
    );
  }

  Widget _pokemonInfo() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(widget.pokemon.name,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Text('#${widget.pokemon.nDex}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          _pokemonTipoChip(widget.pokemon.type1),
          SizedBox(
            width: 10,
          ),
          _pokemonTipoChip(widget.pokemon.type2),
        ],
      ),
    ]);
  }

  Widget _pokemonTipoChip(String tipo) {
    if (tipo == null || tipo.isEmpty) {
      return Container();
    } else {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: getDimention(context, 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: setSecondaryColor(tipo)),
          child: Row(
            children: [
              Text(tipo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getFontSize(context, 16),
                  )),
              Image.asset(
                getTypeImage(tipo),
              ),
            ],
          ));
    }
  }
}
