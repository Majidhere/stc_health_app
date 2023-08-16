import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get appNameStyle {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
          fontSize: 36, fontWeight: FontWeight.w400, color: Colors.white));
}

TextStyle get loginTextStyle {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white));
}

TextStyle get hintTextStyle {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
  ));
}

TextStyle get labelTextStyle {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
  ));
}

TextStyle get buttonTextStyle {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white));
}

TextStyle get richTextStyle {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  ));
}

TextStyle get textButtonStyle {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  ).copyWith(color: Colors.black.withOpacity(0.65)));
}

TextStyle get appBarTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  ));
}

TextStyle get productTitleTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    color: Color(0xFF444B51),
  ));
}

TextStyle get productDescriptionTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Color(0xFF08293B),
  ));
}

TextStyle get productPriceTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: Color(0xFF08293B),
  ));
}

TextStyle get productDetailTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  ));
}

TextStyle get productDetailPriceTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: Color(0xFF08293B),
  ));
}

TextStyle get productDetailDescriptionTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: Color(0xFF838396),
  ));
}

TextStyle get productReviewTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Color(0xFF444B51),
  ));
}

TextStyle get productRatingTextStyle {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  ));
}
