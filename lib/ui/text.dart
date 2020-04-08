import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 20.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 50.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  const SectionText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          letterSpacing: 1.0,
          height: 2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
