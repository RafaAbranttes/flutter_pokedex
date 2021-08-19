import 'package:flutter/material.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final Color cor;
  final Widget image;
  final List<String> tipos;
  final String num;

  PokeItem({this.name, this.index, this.cor, this.image, this.tipos, this.num});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0,2.0)
            )
          ],
          color: cor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Stack(
          children: [
            image,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    fontFamily: 'Google',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
