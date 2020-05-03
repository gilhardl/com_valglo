import 'package:flutter/material.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/text.dart';

class AppBarMenuButton extends StatelessWidget {
  AppBarMenuButton({
    @required this.text,
    @required this.route,
    this.args,
  })  : assert(text != null),
        assert(route != null);

  final String text;
  final String route;
  final PageScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(route, arguments: args);
      },
      child: AppBarMenuButtonText(text),
    );
  }
}
