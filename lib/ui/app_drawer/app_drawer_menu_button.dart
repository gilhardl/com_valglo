import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/core/home/bloc.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/text.dart';

class AppDrawerMenuButton extends StatelessWidget {
  AppDrawerMenuButton({
    @required this.text,
    @required this.icon,
    @required this.route,
    @required this.currentRoute,
    this.args,
  })  : assert(text != null),
        assert(icon != null),
        assert(route != null),
        assert(currentRoute != null);

  final String text;
  final IconData icon;
  final String route;
  final String currentRoute;
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
        if (route != currentRoute) {
          Navigator.of(context).pushReplacementNamed(route);
        }
        if (route == Routes.home) {
          BlocProvider.of<HomeBloc>(context)
              .add(HomeSectionUpdated(args != null ? args.section : ''));
          Navigator.of(context).pop();
        }
      },
    );
  }
}
