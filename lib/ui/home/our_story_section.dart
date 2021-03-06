import 'package:comvalglo/providers/media_query_provider.dart';
import 'package:flutter/material.dart';

import 'package:comvalglo/ui/text.dart';

class OurStorySection extends StatelessWidget {
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
            SectionTitle('Notre histoire'),
            Column(
              children: <Widget>[
                SectionText(
                    "5 étudiants valentinois ambitieux ont décidé de se réunir pour accomplir un pari fou qui leur a été proposé par le conseil de développement du grand Rovaltain. Ce pari est d'inciter des jeunes parents parisiens ou lyonnais à venir vivre dans notre belle agglomération romano-valentinoise."),
                SectionText(
                    'Cette région, riche de son terroir, de son dynamisme et de ses nombreux secteurs d’activité présente tout ce qu’il y a de mieux pour vivre.'),
                SectionText(
                    'Ces étudiants en première année de DUT Techniques de Commercialisation vous présentent leur toute nouvelle agence de communication, COMVALGLO.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
