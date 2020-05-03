import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/app_bar/app_bar.dart';
import 'package:comvalglo/ui/app_bar/app_bar_menu_button.dart';
import 'package:comvalglo/ui/app_drawer/app_drawer.dart';
import 'package:comvalglo/ui/app_drawer/app_drawer_menu_button.dart';

abstract class PageScreenView extends StatelessWidget {
  final String route = '';
}

class PageScreen extends StatelessWidget {
  const PageScreen({
    Key key,
    @required this.body,
  })  : assert(body != null),
        super(key: key);

  final PageScreenView body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MQ.md(context)
            ? Scaffold(
                appBar: AppBarMobile(),
                body: body,
                drawer: AppDrawer(
                  menuButtons: MenuButtons.drawerList(body.route),
                ),
              )
            : Scaffold(
                appBar: AppBarDesktop(
                  menuButtons: MenuButtons.appBarList(body.route),
                ),
                body: body,
              );
      },
    );
  }
}

class MenuButtons {
  static List<AppBarMenuButton> appBarList(String currentRoute) => [
        AppBarMenuButton(
          text: 'Accueil',
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppBarMenuButton(
          text: 'Notre région',
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppBarMenuButton(
          text: 'Notre histoire',
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppBarMenuButton(
          text: 'Qui sommes nous ?',
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppBarMenuButton(
          text: 'Galerie',
          route: Routes.gallery,
          currentRoute: currentRoute,
        ),
        AppBarMenuButton(
          text: 'Nous contacter',
          route: Routes.home,
          currentRoute: currentRoute,
        )
      ];

  static List<AppDrawerMenuButton> drawerList(String currentRoute) => [
        AppDrawerMenuButton(
          text: 'Accueil',
          icon: Icons.home,
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppDrawerMenuButton(
          text: 'Notre région',
          icon: Icons.location_on,
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppDrawerMenuButton(
          text: 'Notre histoire',
          icon: Icons.star,
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppDrawerMenuButton(
          text: 'Qui sommes nous ?',
          icon: Icons.people,
          route: Routes.home,
          currentRoute: currentRoute,
        ),
        AppDrawerMenuButton(
          text: 'Galerie',
          icon: Icons.photo,
          route: Routes.gallery,
          currentRoute: currentRoute,
        ),
        AppDrawerMenuButton(
          text: 'Nous contacter',
          icon: Icons.question_answer,
          route: Routes.home,
          currentRoute: currentRoute,
        )
      ];
}
