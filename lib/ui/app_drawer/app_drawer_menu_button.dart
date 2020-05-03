import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/ui/text.dart';

class AppDrawerMenuButton extends StatelessWidget {
  AppDrawerMenuButton(
      {@required this.text,
      @required this.icon,
      @required this.route,
      currentRoute})
      : assert(text != null),
        assert(icon != null),
        assert(route != null),
        _currentRoute = currentRoute ?? '';

  final String text;
  final IconData icon;
  final String route;
  final String _currentRoute;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return ListTile(
      leading: Icon(
        icon,
        color: _theme.accentColor,
      ),
      title: DrawerMenuButtonText(text),
      onTap: () {
        if (Routes.all.contains(route) && route != _currentRoute) {
          Navigator.of(context).pushReplacementNamed(route);
        } else if (!Routes.all.contains(route)) {
          // Todo : Scroll to the right section in current page
        }
      },
    );
  }
}
