import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/text.dart';
import 'package:comvalglo/ui/home/photos_carousel.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        Image.asset('images/parc_jouvet.png'),
//        HeroContent(),
//      ],
//    );
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: HeroContent(),
    );
  }
}

class HeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: MQ.md(context) ? 2 : 3,
                child: MQ.sm(context)
                    ? Container()
                    : HeroCarousel(
                        key: Key('hero-left-carousel'),
                      ),
              ),
              Flexible(
                flex: MQ.sm(context) ? 5 : MQ.md(context) ? 3 : 5,
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                flex: MQ.md(context) ? 2 : 3,
                child: MQ.sm(context)
                    ? Container()
                    : HeroCarousel(
                        key: Key('hero-right-carousel'),
                        reverse: true,
                      ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: HeroText('ComValGlo, avec vous pour un avenir plus beau'),
        ),
      ],
    );
  }
}

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({
    Key key,
    this.padding = 32.0,
    this.reverse = false,
    this.aspectRatio = 1.0,
  }) : super(key: key);

  final double padding;
  final bool reverse;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          elevation: 12.0,
          child: PhotosCarousel(
            size: const Size(300.0, 300.0),
            reverse: reverse,
            aspectRatio: aspectRatio,
          ),
        ),
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.gallery);
        },
      ),
    );
  }
}
