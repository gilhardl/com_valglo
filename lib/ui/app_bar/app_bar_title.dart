import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comvalglo/constants.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      kAppTitle,
      style: GoogleFonts.galada(),
    );
  }
}
