import 'package:flutter/material.dart';

import 'package:comvalglo/ui/app_drawer/app_drawer_header.dart';
import 'package:comvalglo/ui/app_drawer/app_drawer_menu_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    @required this.menuButtons,
  }) : assert(menuButtons != null);

  final List<AppDrawerMenuButton> menuButtons;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: _theme.primaryColor,
            ),
            child: AppDrawerHeader(),
          ),
        ]..addAll(menuButtons),
      ),
    );
  }
}
