import 'package:flutter/material.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/home/hero_section.dart';
import 'package:comvalglo/ui/home/history_section.dart';
import 'package:comvalglo/ui/home/about_us_section.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ComValGlo',
          style: GoogleFonts.galada(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          HeroSection(),
          Column(
            children: <Widget>[
              OurStorySection(),
              AboutUsSection(),
            ],
          ),
        ],
      ),
    );
  }
}
