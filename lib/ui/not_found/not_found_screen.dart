import 'package:flutter/material.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/not_found/not_found_section.dart';

class NotFoundScreen extends StatelessWidget {
  static final String notFoundSectionKey = 'not-found';
  final _pageSections = [
    PageSection(
      key: NotFoundScreen.notFoundSectionKey,
      child: NotFoundSection(),
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
