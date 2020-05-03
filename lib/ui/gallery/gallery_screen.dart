import 'package:flutter/material.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/gallery/gallery_section.dart';

class GalleryScreen extends StatelessWidget {
  static final String gallerySectionKey = 'gallery-gallery';

  final _pageSections = [
    PageSection(
      key: GalleryScreen.gallerySectionKey,
      child: GallerySection(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _pageSections.length + 1,
      itemBuilder: (context, index) {
        if (index < _pageSections.length) {
          return _pageSections[index].child;
        } else {
          return SizedBox(
            height: 50.0,
          );
        }
      },
    );
  }
}
