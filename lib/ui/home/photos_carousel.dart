import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:comvalglo/data/photo.dart';
import 'package:comvalglo/data/photos_reposirory.dart';

class PhotosCarousel extends StatelessWidget {
  PhotosCarousel({
    this.size = Size.infinite,
    this.reverse = false,
    this.aspectRatio = 1.0,
  });

  final Size size;
  final bool reverse;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    PhotosRepository photosRepository = Provider.of<PhotosRepository>(context);
    List<Photo> photos = List.from(photosRepository.photos);
    photos.shuffle();

    return photosRepository.allPhotosUriLoaded
        ? CarouselSlider(
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.bounceOut,
            scrollDirection: Axis.vertical,
            reverse: reverse,
            aspectRatio: aspectRatio,
            viewportFraction: 1.0,
            // Todo : Améliorer chargement des photos
            items: photos
                .where((Photo photo) => photo.uri != null)
                .map((Photo photo) => AspectRatio(
                      aspectRatio: aspectRatio,
                      child: Image.network(
                        photo.uri,
                        height: size.height,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
          )
        : Container();
  }
}
