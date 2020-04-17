import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/data/photo.dart';
import 'package:comvalglo/data/photos_reposirory.dart';

import 'package:comvalglo/ui/text.dart';

class GallerySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle('Galerie photos'),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MQ.contentMaxWidth(context),
          ),
          child: Gallery(),
        ),
      ],
    );
  }
}

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PhotosRepository photosRepository = Provider.of<PhotosRepository>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 12.0,
        runSpacing: 12.0,
        children: photosRepository.photos
            .where((Photo photo) => photo.uri != null)
            .map((Photo photo) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 8.0,
            child: Image.network(
              photo.uri,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }
}
