import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedexapp/const/const_app.dart';
import 'package:pokedexapp/pages/home_page/widgets/app_bar_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
        ],
      ),
    );
  }
}
