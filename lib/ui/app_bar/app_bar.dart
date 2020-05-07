import 'package:flutter/material.dart';

import 'package:comvalglo/ui/app_bar/app_bar_title.dart';
import 'package:comvalglo/ui/app_bar/app_bar_menu_button.dart';

class AppBarDesktop extends StatelessWidget implements PreferredSizeWidget {
  AppBarDesktop({
    @required this.menuButtons,
  })  : assert(menuButtons != null),
        preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  final List<AppBarMenuButton> menuButtons;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: AppBarTitle(), actions: menuButtons);
  }
}

class AppBarMobile extends StatelessWidget implements PreferredSizeWidget {
  AppBarMobile() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppBarTitle(),
      leading: FlatButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }
}
