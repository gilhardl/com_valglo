import 'package:comvalglo/providers/media_query_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarMenuButtonText extends StatelessWidget {
  const AppBarMenuButtonText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        height: 1.2,
        color: Colors.white,
      ),
    );
  }
}

class DrawerMenuButtonText extends StatelessWidget {
  const DrawerMenuButtonText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Text(
      '$text',
      textAlign: TextAlign.start,
      style: GoogleFonts.montserrat(
        height: 1.2,
        color: _theme.primaryColor,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: MQ.md(context) ? 20.0 : 50.0,
        bottom: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: GoogleFonts.galada(
              fontSize: MQ.md(context) ? 24.0 : MQ.lg(context) ? 32.0 : 50.0,
              height: 1.0,
              color: _theme.primaryColor, //Colors.grey[900],
            ),
            textAlign: TextAlign.center,
          ),
          SectionTitleUnderline(color: _theme.accentColor),
        ],
      ),
    );
  }
}

class SectionTitleUnderline extends StatelessWidget {
  const SectionTitleUnderline({
    @required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      width: 60.0,
      color: color,
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
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: GoogleFonts.galada(
            color: _theme.primaryColor,
            fontSize: 50.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
