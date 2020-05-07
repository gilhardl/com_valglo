import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:comvalglo/providers/media_query_provider.dart';

import 'package:comvalglo/ui/text.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
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
            SectionTitle('Nous contacter'),
            LayoutBuilder(
              builder: (context, constraints) {
                return MQ.md(context)
                    ? Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: ContactForm(),
                          ),
                          ContactDetails(),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          Expanded(child: ContactDetails()),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: ContactForm(),
                            ),
                          ),
                        ],
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
          width: 200.0,
          height: 200.0,
        ),
        ContactDetailsRow(
          text: '0660899707',
          icon: Icons.phone,
        ),
        ContactDetailsRow(
          text: 'comvalglo26@gmail.com',
          icon: Icons.email,
        ),
        ContactDetailsRow(
          text: '51 Rue Barthélémy de Laffemas, 26600 VALENCE',
          icon: Icons.location_on,
        ),
        SizedBox(
          height: 24.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                launch('https://www.facebook.com/Comvalglo-104553991205531/');
              },
              child: Icon(
                FontAwesomeIcons.facebook,
                size: 64.0,
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            FlatButton(
              onPressed: () {
                launch('https://www.instagram.com/comvalglo/');
              },
              child: Icon(
                FontAwesomeIcons.instagram,
                size: 64.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ContactDetailsRow extends StatelessWidget {
  const ContactDetailsRow({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 32.0,
              ),
            )),
        Flexible(
          flex: 5,
          child: ContactDetailsText(text),
        )
      ],
    );
  }
}

class ContactDetailsText extends StatelessWidget {
  const ContactDetailsText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.montserrat(
        color: Colors.grey[700],
        fontSize: MQ.sm(context) ? 11.0 : 16.0,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _subject = '';
  String _message = '';

  final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
    functionName: 'emailMessage',
  );

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'NOM Prénom',
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Veuillez saisir un NOM Prénom'
                      : null;
                },
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Veuillez saisir une adresse email'
                      : null;
                },
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Objet de votre demande',
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Veuillez saisir l\'objet de votre demande'
                      : null;
                },
                onSaved: (value) => _subject = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Votre message',
                ),
                minLines: 10,
                maxLines: 30,
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Veuillez saisir votre message'
                      : null;
                },
                onSaved: (value) => _message = value,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: RaisedButton(
            color: _theme.primaryColor,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                try {
                  final res = await callable.call({
                    'name': _name,
                    'email': _email,
                    'subject': _subject,
                    'message': _message
                  });
                  print(res.data);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Message envoyé ! L\'équipe ComValGlo vous en remercie et reviendra vers vous dans les plus brefs délais.'),
                  ));
                  _formKey.currentState.reset();
                } catch (e) {
                  print(e);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Impossible d\'envoyer le message actuellement... Veuillez envoyer un email à l\'adresse comvalglo26@gmail.com'),
                  ));
                }
              }
            },
            child: Text('Envoyer le message',
                style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }
}
