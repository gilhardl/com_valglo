import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/home/hero_section.dart';
import 'package:comvalglo/ui/home/region_presentation_section.dart';
import 'package:comvalglo/ui/home/our_story_section.dart';
import 'package:comvalglo/ui/home/about_us_section.dart';

class HomeScreen extends PageScreenView {
  @override
  final String route = Routes.home;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HeroSection(),
        Column(
          children: <Widget>[
            RegionPresentationSection(),
            OurStorySection(),
            AboutUsSection(),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ],
    );
  }
}
