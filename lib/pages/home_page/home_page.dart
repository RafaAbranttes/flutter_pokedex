import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedexapp/const/const_app.dart';
import 'package:pokedexapp/models/pokeapi.dart';
import 'package:pokedexapp/pages/home_page/widgets/app_bar_home.dart';
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
              child: Observer(
              name: 'ListaHomePage',
              builder: (BuildContext context) {
                PokeAPI _pokeApi = pokeApiStore.pokeAPI;
                return (_pokeApi != null)
                    ? ListView.builder(
                        itemCount: _pokeApi.pokemon.length,
                        itemBuilder: (contex, index) {
                          return ListTile(
                            title: Text('${_pokeApi.pokemon[index].name}'),
                          );
                        })
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
