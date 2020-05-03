import 'package:flutter/material.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/text.dart';

class AppDrawerMenuButton extends StatelessWidget {
  AppDrawerMenuButton({
    @required this.text,
    @required this.icon,
    @required this.route,
    this.args,
  })  : assert(text != null),
        assert(icon != null),
        assert(route != null);

  final String text;
  final IconData icon;
  final String route;
  final PageScreenArguments args;

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
        Navigator.of(context).pushReplacementNamed(route, arguments: args);
      },
    );
  }
}
