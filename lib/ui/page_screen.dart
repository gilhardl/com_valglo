import 'package:comvalglo/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/app_bar/app_bar.dart';
import 'package:comvalglo/ui/app_bar/app_bar_menu_button.dart';
import 'package:comvalglo/ui/app_drawer/app_drawer.dart';
import 'package:comvalglo/ui/app_drawer/app_drawer_menu_button.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({
    Key key,
    @required this.body,
    @required this.route,
  })  : assert(body != null),
        assert(route != null),
        super(key: key);

  final Widget body;
  final String route;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MQ.md(context)
            ? Scaffold(
                appBar: AppBarMobile(),
                body: body,
                drawer: AppDrawer(
                  menuButtons: MenuButtons.drawerList(route),
                ),
              )
            : Scaffold(
                appBar: AppBarDesktop(
                  menuButtons: MenuButtons.appBarList(route),
                ),
                body: body,
              );
      },
    );
  }
}

class PageScreenArguments {
  const PageScreenArguments({
    String section,
  }) : this.section = section ?? '';

  final String section;

  @override
  String toString() => 'PageScreenArguments { section: $section }';
}

class PageSection {
  const PageSection({@required this.key, @required this.child});

  final String key;
  final Widget child;
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
          args: PageScreenArguments(
              section: HomeScreen.regionPresentationSectionKey),
          currentRoute: currentRoute,
        ),
        AppBarMenuButton(
          text: 'Notre histoire',
          route: Routes.home,
          args: PageScreenArguments(section: HomeScreen.ourStorySectionKey),
          currentRoute: currentRoute,
        ),
        AppBarMenuButton(
          text: 'Qui sommes nous ?',
          route: Routes.home,
          args: PageScreenArguments(section: HomeScreen.aboutUsSectionKey),
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
          args: PageScreenArguments(section: HomeScreen.contactSectionKey),
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
          args: PageScreenArguments(
              section: HomeScreen.regionPresentationSectionKey),
          currentRoute: currentRoute,
        ),
        AppDrawerMenuButton(
          text: 'Notre histoire',
          icon: Icons.star,
          route: Routes.home,
          args: PageScreenArguments(section: HomeScreen.ourStorySectionKey),
          currentRoute: currentRoute,
        ),
        AppDrawerMenuButton(
          text: 'Qui sommes nous ?',
          icon: Icons.people,
          route: Routes.home,
          args: PageScreenArguments(section: HomeScreen.aboutUsSectionKey),
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
          args: PageScreenArguments(section: HomeScreen.contactSectionKey),
          currentRoute: currentRoute,
        )
      ];
}
