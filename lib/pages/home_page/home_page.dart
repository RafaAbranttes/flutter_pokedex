import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedexapp/const/const_app.dart';
import 'package:pokedexapp/models/pokeapi.dart';
import 'package:pokedexapp/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedexapp/pages/home_page/widgets/poke_item.dart';
import 'package:pokedexapp/stores/pokeapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -screenWidth / 6,
            left: screenWidth - screenWidth / 2.3,
            child: Image.asset(
              ConstApp.whitePokeball,
              height: screenWidth / 1.5,
              width: screenWidth / 1.5,
            ),
          ),
          AppbarHomeWidget(),
          Container(
            margin: EdgeInsets.only(top: screenWidth * 0.55),
            decoration: BoxDecoration(
              color: Color.fromRGBO(238, 27, 36, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            child: Container(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.02 / 2,
                    left: screenWidth * 0.02 / 2,
                    top: screenHeight * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Observer(
                  name: 'ListaHomePage',
                  builder: (BuildContext context) {
                    PokeAPI _pokeApi = pokeApiStore.pokeAPI;
                    return (_pokeApi != null)
                        ? ClipRRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(16.0),
                            child: AnimationLimiter(
                              child: ClipRRect(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(45),
                                      topRight: Radius.circular(45),
                                    ),
                                  ),
                                  child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.all(12),
                                    addAutomaticKeepAlives: false,
                                    gridDelegate:
                                        new SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemCount:
                                        pokeApiStore.pokeAPI.pokemon.length,
                                    itemBuilder: (context, index) {
                                      Pokemon pokemon =
                                          pokeApiStore.getPokemon(index: index);
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            topRight: Radius.circular(45),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: AnimationConfiguration
                                              .staggeredGrid(
                                            position: index,
                                            columnCount: 2,
                                            duration: const Duration(
                                                milliseconds: 375),
                                            child: ScaleAnimation(
                                              child: GestureDetector(
                                                child: PokeItem(
                                                    index: index,
                                                    cor: ConstApp.getColorType(
                                                        type: pokemon.type[0]),
                                                    tipos: pokemon.type,
                                                    name: pokemon.name,
                                                    num: pokemon.num,
                                                    image: Hero(
                                                      tag: pokemon.num,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 50, top: 50),
                                                        padding: EdgeInsets.all(8.0),
                                                        child: pokeApiStore
                                                            .getImage(
                                                                numero: pokemon
                                                                    .num),
                                                      ),
                                                    )),
                                                onTap: () {
                                                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> PokeDetailPage(index: index),
                                                  // fullscreenDialog: true)
                                                  // );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
