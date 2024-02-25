import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Community Screen",
          style:
              GoogleFonts.merienda(fontSize: 30, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
