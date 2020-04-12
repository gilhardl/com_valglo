import 'package:flutter/material.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/data/person.dart';
import 'package:comvalglo/data/persons_repository.dart';

import 'package:comvalglo/ui/text.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsSection extends StatelessWidget {
  final List<Person> _persons = PersonsRepository().persons;

  @override
  Widget build(BuildContext context) {
//    _persons.shuffle();

    return Column(
      children: <Widget>[
        SectionTitle('Qui sommes nous ?'),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MQ.xlMaxWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 50.0,
              runSpacing: 40.0,
              children: _persons
                  .map((Person person) => ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: 220.0, height: 350.0),
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
        )
      ],
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
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
    return Text('$name',
        style: GoogleFonts.montserrat(
          fontSize: 16.0,
          letterSpacing: 1.2,
          color: Colors.grey[800],
        ));
  }
}
