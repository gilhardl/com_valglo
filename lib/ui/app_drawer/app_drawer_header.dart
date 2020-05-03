import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:comvalglo/constants.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        kAppTitle,
        style: GoogleFonts.galada(
          color: Colors.white,
          fontSize: 32.0,
        ),
      ),
    );
  }
}
