import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/core/home/bloc.dart';

import 'package:comvalglo/ui/page_screen.dart';
import 'package:comvalglo/ui/text.dart';

class AppBarMenuButton extends StatelessWidget {
  AppBarMenuButton({
    @required this.text,
    @required this.route,
    @required this.currentRoute,
    this.args,
  })  : assert(text != null),
        assert(route != null),
        assert(currentRoute != null);

  final String text;
  final String route;
  final String currentRoute;
  final PageScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (route != currentRoute) {
          Navigator.of(context).pushReplacementNamed(route);
        }
        if (route == Routes.home) {
          BlocProvider.of<HomeBloc>(context)
              .add(HomeSectionUpdated(args != null ? args.section : ''));
        }
      },
      child: AppBarMenuButtonText(text),
    );
  }
}
