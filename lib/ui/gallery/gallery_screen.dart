import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/ui/gallery/gallery_section.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({@required this.appBar}) : assert(appBar != null);

  final route = Routes.gallery;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: <Widget>[
          GallerySection(),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
