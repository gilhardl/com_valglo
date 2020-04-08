import 'package:flutter/material.dart';

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

class HeroText extends StatelessWidget {
  const HeroText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Text(
      text,
      style: TextStyle(
        color: _theme.primaryColor,
        fontSize: 50.0,
        fontWeight: FontWeight.w800,
      ),
      textAlign: TextAlign.center,
    );
  }
}
