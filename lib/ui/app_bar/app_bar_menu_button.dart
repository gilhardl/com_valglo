import 'package:comvalglo/routes.dart';
import 'package:comvalglo/ui/text.dart';
import 'package:flutter/material.dart';

class AppBarMenuButton extends StatelessWidget {
  AppBarMenuButton({@required this.text, @required this.route, currentRoute})
      : assert(text != null),
        assert(route != null),
        _currentRoute = currentRoute ?? '';

  final String text;
  final String route;
  final String _currentRoute;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (Routes.all.contains(route) && route != _currentRoute) {
          Navigator.of(context).pushReplacementNamed(route);
        } else if (!Routes.all.contains(route)) {
          // Todo : Scroll to the right section in current page
        }
      },
      child: AppBarMenuButtonText(text),
    );
  }
}
