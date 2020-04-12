import 'package:flutter/material.dart';

import 'package:comvalglo/ui/text.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('images/parc_jouvet.png'),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('images/logo.png'),
                SizedBox(
                  height: 30.0,
                ),
                HeroText('ComValGlo, avec vous pour un avenir plus beau'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
