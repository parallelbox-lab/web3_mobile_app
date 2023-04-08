import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final double? letterspacing;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  const CustomText(
      {Key? key,
      required this.text,
      this.size,
      this.color,
      this.letterspacing = 0,
      this.textAlign,
      this.weight,
      this.decoration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
      final sizer = MediaQuery.of(context).size;
    return Text(text ?? '',
        style: GoogleFonts.nunito(
          textStyle:TextStyle(
                letterSpacing: letterspacing,
                fontSize: size ?? sizer.width / 22,
                color: color,
                decoration: decoration ?? TextDecoration.none,
                fontWeight: weight ?? FontWeight.normal),
                ),
              textAlign:textAlign ?? TextAlign.left 
                );
  }
}
