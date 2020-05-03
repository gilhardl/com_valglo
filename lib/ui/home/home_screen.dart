import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/home/hero_section.dart';
import 'package:comvalglo/ui/home/region_presentation_section.dart';
import 'package:comvalglo/ui/home/our_story_section.dart';
import 'package:comvalglo/ui/home/about_us_section.dart';

class HomeScreen extends StatefulWidget {
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
      child: RegionPresentationSection(),
    ),
    PageSection(
      key: HomeScreen.ourStorySectionKey,
      child: OurStorySection(),
    ),
    PageSection(
      key: HomeScreen.aboutUsSectionKey,
      child: AboutUsSection(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final PageScreenArguments args =
          ModalRoute.of(context).settings.arguments;

      if (args?.section != null) {
        final sectionIndex =
            _pageSections.indexWhere((section) => section.key == args.section);
        _scrollController.scrollTo(
            index: sectionIndex, duration: Duration(seconds: 1));
      }
    });
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
