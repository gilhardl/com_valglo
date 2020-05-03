import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/gallery/gallery_section.dart';

class GalleryScreen extends PageScreenView {
  @override
  final String route = Routes.gallery;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GallerySection(),
        SizedBox(
          height: 50.0,
        )
      ],
    );
  }
}
