import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.3,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 100.0,
            right: 100.0,
            bottom: 15.0,
          ),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 50.0,
              color: Colors.grey[900],
            ),
            textAlign: TextAlign.center,
          ),
        ),
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
        style: GoogleFonts.montserrat(
          fontSize: 18.0,
          letterSpacing: 1.0,
          height: 2,
          color: Colors.grey[900],
          fontWeight: FontWeight.w200,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ContentText extends StatelessWidget {
  const ContentText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        height: 1.4,
        color: Colors.grey[900],
        fontWeight: FontWeight.w200,
      ),
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
      style: GoogleFonts.galada(
        color: _theme.primaryColor,
        fontSize: 50.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
