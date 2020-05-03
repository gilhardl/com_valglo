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
  })  : assert(body != null),
        super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MQ.md(context)
            ? Scaffold(
                appBar: AppBarMobile(),
                body: body,
                drawer: AppDrawer(
                  menuButtons: MenuButtons.drawerList,
                ),
              )
            : Scaffold(
                appBar: AppBarDesktop(
                  menuButtons: MenuButtons.appBarList,
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
  static List<AppBarMenuButton> appBarList = [
    AppBarMenuButton(
      text: 'Accueil',
      route: Routes.home,
    ),
    AppBarMenuButton(
      text: 'Notre région',
      route: Routes.home,
      args:
          PageScreenArguments(section: HomeScreen.regionPresentationSectionKey),
    ),
    AppBarMenuButton(
      text: 'Notre histoire',
      route: Routes.home,
      args: PageScreenArguments(section: HomeScreen.ourStorySectionKey),
    ),
    AppBarMenuButton(
      text: 'Qui sommes nous ?',
      route: Routes.home,
      args: PageScreenArguments(section: HomeScreen.aboutUsSectionKey),
    ),
    AppBarMenuButton(
      text: 'Galerie',
      route: Routes.gallery,
    ),
    AppBarMenuButton(
      text: 'Nous contacter',
      route: Routes.home,
      args: PageScreenArguments(section: HomeScreen.contactSectionKey),
    )
  ];

  static List<AppDrawerMenuButton> drawerList = [
    AppDrawerMenuButton(
      text: 'Accueil',
      icon: Icons.home,
      route: Routes.home,
    ),
    AppDrawerMenuButton(
      text: 'Notre région',
      icon: Icons.location_on,
      route: Routes.home,
      args:
          PageScreenArguments(section: HomeScreen.regionPresentationSectionKey),
    ),
    AppDrawerMenuButton(
      text: 'Notre histoire',
      icon: Icons.star,
      route: Routes.home,
      args: PageScreenArguments(section: HomeScreen.ourStorySectionKey),
    ),
    AppDrawerMenuButton(
      text: 'Qui sommes nous ?',
      icon: Icons.people,
      route: Routes.home,
      args: PageScreenArguments(section: HomeScreen.aboutUsSectionKey),
    ),
    AppDrawerMenuButton(
      text: 'Galerie',
      icon: Icons.photo,
      route: Routes.gallery,
    ),
    AppDrawerMenuButton(
      text: 'Nous contacter',
      icon: Icons.question_answer,
      route: Routes.home,
      args: PageScreenArguments(section: HomeScreen.contactSectionKey),
    )
  ];
}
