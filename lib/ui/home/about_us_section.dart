import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/data/person.dart';
import 'package:comvalglo/data/persons_repository.dart';

import 'package:comvalglo/ui/text.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Person> _persons =
        Provider.of<PersonsRepository>(context).persons;
    _persons.shuffle();

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
            SectionTitle('Qui sommes nous ?'),
            Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: MQ.md(context) ? 20.0 : 50.0,
                runSpacing: MQ.md(context) ? 70.0 : 80.0,
                children: _persons
                    .map((Person person) => ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: 250.0, height: 350.0),
                          child: PersonCard(
                            name: person.name,
                            age: person.age,
                            location: person.location,
                            picture: 'images/${person.picture}',
                            presentation: person.presentation,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key key,
    @required this.name,
    @required this.age,
    @required this.picture,
    @required this.location,
    @required this.presentation,
  }) : super(key: key);

  final String name;
  final int age;
  final String location;
  final String picture;
  final String presentation;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 130.0,
        height: 190.0,
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 55.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 4.0,
                    ),
                    child: PersonNameText(name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PersonMetaText('$age ans - $location'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: ContentText(presentation),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -50.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: 110.0,
                  ),
                  child: PersonAvatar(picture),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonAvatar extends StatelessWidget {
  const PersonAvatar(this.picture);

  final String picture;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      elevation: 4.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipOval(
          child: Image.asset(picture),
        ),
      ),
    );
  }
}

class PersonMetaText extends StatelessWidget {
  const PersonMetaText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.montserrat(
        color: Colors.grey[700],
        fontSize: 11.0,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}

class PersonNameText extends StatelessWidget {
  const PersonNameText(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name',
      style: GoogleFonts.montserrat(
        fontSize: 16.0,
        letterSpacing: 1.2,
        color: Colors.grey[800],
      ),
    );
  }
}
