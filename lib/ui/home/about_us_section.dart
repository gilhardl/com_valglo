import 'dart:math';

import 'package:flutter/material.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/data/person.dart';
import 'package:comvalglo/data/persons_repository.dart';

import 'package:comvalglo/ui/text.dart';

class AboutUsSection extends StatelessWidget {
  final List<Person> _persons = PersonsRepository().persons;

  @override
  Widget build(BuildContext context) {
    _persons.shuffle();

    return Column(
      children: <Widget>[
        SectionTitle('Qui sommes nous ?'),
//        GridView.count(
//          crossAxisCount: 2,
//          shrinkWrap: true,
//          children: persons
//              .map((Person person) => PersonItem(
//                    name: person.name,
//                    age: person.age,
//                    location: person.location,
//                    picture: 'images/${person.picture}',
//                    presentation: person.presentation,
//                  ))
//              .toList(),
//        ),

        Wrap(
          alignment: WrapAlignment.center,
          children: _persons
              .map((Person person) => ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MQ.xlMaxWidth / 2,
                    ),
                    child: PersonItem(
                      name: person.name,
                      age: person.age,
                      location: person.location,
                      picture: 'images/${person.picture}',
                      presentation: person.presentation,
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}

class PersonItem extends StatelessWidget {
  const PersonItem({
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 220.0,
              minWidth: 220.0,
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(picture),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 4.0,
            ),
            child: Text(
              '$name',
              style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '$age ans - $location',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 250.0,
            ),
            child: Text(
              '$presentation',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
