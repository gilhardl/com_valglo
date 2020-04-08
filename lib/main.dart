import 'package:flutter/material.dart';

import 'package:comvalglo/ui/home/home_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComValGlo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.redAccent[400],
        accentColor: Colors.purple[800],
      ),
      home: HomeScreen(),
    );
  }
}
