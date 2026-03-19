import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText({super.key, this.color, this.size, this.text});

  final String? text;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.poppins(color: color, fontSize: size),
    );
  }
}
