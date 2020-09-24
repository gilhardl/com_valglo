import 'dart:async';
import 'dart:html';
import 'dart:ui' as ui;

import 'package:comvalglo/constants.dart';
import 'package:comvalglo/core/home/bloc.dart';
import 'package:comvalglo/ui/screens.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/home/hero_section.dart';
import 'package:comvalglo/ui/home/region_presentation_section.dart';
import 'package:comvalglo/ui/home/our_story_section.dart';
import 'package:comvalglo/ui/home/about_us_section.dart';
import 'package:comvalglo/ui/home/contact_section.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  static final String heroSectionKey = 'home-hero';
  static final String regionPresentationSectionKey = 'home-region-presentation';
  static final String ourStorySectionKey = 'home-our-story';
  static final String aboutUsSectionKey = 'home-about-us';
  static final String contactSectionKey = 'home-contact';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ItemScrollController _scrollController = ItemScrollController();

  final _pageSections = [
    PageSection(
      key: HomeScreen.heroSectionKey,
      child: HeroSection(),
    ),
    PageSection(
      key: HomeScreen.regionPresentationSectionKey,
      child: RepaintBoundary(
        child: RegionPresentationSection(),
      ),
    ),
    PageSection(
      key: HomeScreen.ourStorySectionKey,
      child: OurStorySection(),
    ),
    PageSection(
      key: HomeScreen.aboutUsSectionKey,
      child: AboutUsSection(),
    ),
    PageSection(
      key: HomeScreen.contactSectionKey,
      child: ContactSection(),
    ),
  ];
  StreamSubscription _blocSubscription;

  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'youtube_iframe',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src =
              'https://www.youtube.com/embed/$kRegionPresentationVideoYoutubeId?autoplay=1'
          ..style.border = 'none');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _blocSubscription = BlocProvider.of<HomeBloc>(context).listen((state) {
        if (state == '') {
          state = HomeScreen.heroSectionKey;
        }
        final sectionIndex =
            _pageSections.indexWhere((section) => section.key == state);
        _scrollController.scrollTo(
            index: sectionIndex, duration: Duration(seconds: 1));
      });
    });
  }

  @override
  void dispose() {
    if (_blocSubscription != null) {
      _blocSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: _scrollController,
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
