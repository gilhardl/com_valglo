import 'dart:async';

import 'package:flutter/material.dart';

import 'package:comvalglo/routes.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/text.dart';

class NotFoundSection extends StatefulWidget {
  const NotFoundSection({this.remainingTime = 0});

  final int remainingTime;

  @override
  _NotFoundSectionState createState() => _NotFoundSectionState();
}

class _NotFoundSectionState extends State<NotFoundSection> {
  int _remainingTime = 5;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingTime - 1 < 0) {
          timer.cancel();
          Navigator.of(context).pushReplacementNamed(Routes.home);
        } else {
          setState(() {
            _remainingTime--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MQ.contentMaxWidth(context),
        minHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SectionTitle('Page non trouvée'),
            Column(
              children: <Widget>[
                SectionText(
                    'La page que vous avez demandé n\'a pas été trouvée. Vous allez être redirigé(e) vers la page d\'accueil dans ${_remainingTime}s...'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
