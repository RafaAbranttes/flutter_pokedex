import 'package:flutter/material.dart';
import 'package:pokedexapp/const/const_app.dart';

class AppbarHomeWidget extends StatelessWidget {
  const AppbarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.05),
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Image.asset(
                                ConstApp.pokedexLogo,
                                width: screenHeight * 0.22,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.menu,
                                  size: screenWidth * 0.08,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}