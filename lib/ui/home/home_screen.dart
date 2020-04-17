import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/ui/home/hero_section.dart';
import 'package:comvalglo/ui/home/our_story_section.dart';
import 'package:comvalglo/ui/home/about_us_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({@required this.appBar}) : assert(appBar != null);

  final route = Routes.home;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: <Widget>[
          HeroSection(),
          Column(
            children: <Widget>[
              OurStorySection(),
              AboutUsSection(),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
