import 'package:comvalglo/providers/media_query_provider.dart';
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
                Image.asset(
                  'images/logo.png',
                  width: MediaQuery.of(context).size.width / 2.5,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: MQ.sm(context) ? 10.0 : MQ.md(context) ? 20.0 : 50.0,
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
