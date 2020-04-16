import 'package:comvalglo/ui/notch_card/notched_rounded_rectangle_border.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 65.0),
//            child: Wrap(
//              alignment: WrapAlignment.center,
//              spacing: 50.0,
//              runSpacing: 80.0,
//              children: _persons
//                  .map((Person person) => ConstrainedBox(
//                        constraints: BoxConstraints.tightFor(
//                            width: 220.0, height: 380.0),
//                        child: PersonCard(
//                          name: person.name,
//                          age: person.age,
//                          location: person.location,
//                          picture: 'images/${person.picture}',
//                          presentation: person.presentation,
//                        ),
//                      ))
//                  .toList(),
//            ),
//          ),
            child: CardTest(),
          ),
        ),
      ],
    );
  }
}

class CardTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      shape: NotchedRoundedRectangleBorder(),
      elevation: 16.0,
      child: Container(
        width: 200.0,
        height: 100.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('and a text here too'),
              ),
              left: 140.0,
              right: 4.0,
              top: 4.0,
            ),
            Positioned(
              child: Text(
                'I want a text here',
                style: TextStyle(fontSize: 24.0),
              ),
              top: 40.0,
              left: 4.0,
            )
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
        width: 110.0,
        height: 190.0,
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Material(
            elevation: 6.0,
            shape: NotchedRoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.red,
            clipBehavior: Clip.antiAlias,
//            child: CardContent(
//              name: name,
//              age: age,
//              location: location,
//              presentation: presentation,
//            ),
            child: Container(
              width: 200.0,
              height: 100.0,
              color: Colors.grey,
            ),
          ),

//          Card(
//            elevation: 2,
//            child: ClipPath(
//              child: Container(
//                decoration: BoxDecoration(
//                  border: Border(
//                    right: BorderSide(color: Colors.green, width: 5),
//                  ),
//                ),
//              ),
//              clipper: ShapeBorderClipper(
//                shape: NotchedRoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(3),
//                ),
//              ),
//            ),
//          )

//          Positioned(
//            top: -38.0,
//            left: 0.0,
//            right: 0.0,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                ConstrainedBox(
//                  constraints: BoxConstraints.tightFor(
//                    width: 110.0,
//                  ),
//                  child: Padding(
//                    padding: const EdgeInsets.all(5.0),
//                    child: PersonAvatar(picture),
//                  ),
//                ),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    Key key,
    @required this.name,
    @required this.age,
    @required this.location,
    @required this.presentation,
  }) : super(key: key);

  final String name;
  final int age;
  final String location;
  final String presentation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 70.0,
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
    );
  }
}

class PersonAvatar extends StatelessWidget {
  const PersonAvatar(this.picture);

  final String picture;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(picture),
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

class PersonAvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 220;
    final double _yScaling = size.height / 380;
    path.lineTo(204 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      212.836556 * _xScaling,
      0 * _yScaling,
      220 * _xScaling,
      7.163444 * _yScaling,
      220 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      220 * _xScaling,
      16 * _yScaling,
      220 * _xScaling,
      364 * _yScaling,
      220 * _xScaling,
      364 * _yScaling,
    );
    path.cubicTo(
      220 * _xScaling,
      372.836556 * _yScaling,
      212.836556 * _xScaling,
      380 * _yScaling,
      204 * _xScaling,
      380 * _yScaling,
    );
    path.cubicTo(
      204 * _xScaling,
      380 * _yScaling,
      16 * _xScaling,
      380 * _yScaling,
      16 * _xScaling,
      380 * _yScaling,
    );
    path.cubicTo(
      7.163444 * _xScaling,
      380 * _yScaling,
      0 * _xScaling,
      372.836556 * _yScaling,
      0 * _xScaling,
      364 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      364 * _yScaling,
      0 * _xScaling,
      16 * _yScaling,
      0 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      7.163444 * _yScaling,
      7.163444 * _xScaling,
      0 * _yScaling,
      16 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      16 * _xScaling,
      0 * _yScaling,
      34 * _xScaling,
      0 * _yScaling,
      34 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      42.836556 * _xScaling,
      -1.623249e-15 * _yScaling,
      50 * _xScaling,
      7.163444 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      50 * _xScaling,
      49.137085 * _yScaling,
      76.862915 * _xScaling,
      76 * _yScaling,
      110 * _xScaling,
      76 * _yScaling,
    );
    path.cubicTo(
      143.137085 * _xScaling,
      76 * _yScaling,
      170 * _xScaling,
      49.137085 * _yScaling,
      170 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      170 * _xScaling,
      7.163444 * _yScaling,
      177.163444 * _xScaling,
      1.623249e-15 * _yScaling,
      186 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      186 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
