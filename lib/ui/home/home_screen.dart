import 'package:flutter/material.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/home/hero_section.dart';
import 'package:comvalglo/ui/home/history_section.dart';
import 'package:comvalglo/ui/home/about_us_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComValGlo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeroSection(),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MQ.xlMaxWidth,
              ),
              child: Column(
                children: <Widget>[
                  OurStorySection(),
                  AboutUsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
