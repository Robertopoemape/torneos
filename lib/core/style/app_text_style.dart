import 'package:flutter/material.dart';
import 'package:proyecto_torneos/core/style/app_colors.dart';

const String font = 'Poppins';
const String fontFamily = 'Furious';

const TextStyle textStyle = TextStyle(
  fontFamily: font,
  color: ComColors.white1000,
);

const TextStyle textStyleFurious = TextStyle(
  fontFamily: fontFamily,
  color: ComColors.white,
);

const double _display96Size = 96;
const double _display60Size = 60;
const double _display64Size = 64;
const double _display48Size = 48;
const double _display36Size = 36;
const double _display34Size = 34;
const double _display24Size = 24;
const double _display20Size = 20;
const double _display16Size = 16;
const double _display14Size = 14;
const double _display13Size = 13;
const double _display12Size = 12;
const double _display10Size = 10;

extension TextStyleWeightExtension on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

extension TextStyleColorExtension on TextStyle {
  // this grupo vitality colors is same to Colors.green light
  TextStyle get greenL100 => copyWith(color: ComColors.greenL100);
  TextStyle get greenL200 => copyWith(color: ComColors.greenL200);
  TextStyle get greenL300 => copyWith(color: ComColors.greenL300);
  TextStyle get greenL400 => copyWith(color: ComColors.greenL400);
  TextStyle get greenL500 => copyWith(color: ComColors.greenL500);
  TextStyle get greenL600 => copyWith(color: ComColors.greenL600);
  TextStyle get greenL700 => copyWith(color: ComColors.greenL700);
  TextStyle get greenL800 => copyWith(color: ComColors.greenL800);
  TextStyle get greenL900 => copyWith(color: ComColors.greenL900);
  TextStyle get greenL1000 => copyWith(color: ComColors.greenL1000);

  // this group of dark colors is equal to Colors.black
  TextStyle get black100 => copyWith(color: ComColors.black100);
  TextStyle get black200 => copyWith(color: ComColors.black200);
  TextStyle get black300 => copyWith(color: ComColors.black300);
  TextStyle get black400 => copyWith(color: ComColors.black400);
  TextStyle get black500 => copyWith(color: ComColors.black500);
  TextStyle get black600 => copyWith(color: ComColors.black600);
  TextStyle get black700 => copyWith(color: ComColors.black700);
  TextStyle get black800 => copyWith(color: ComColors.black800);
  TextStyle get black900 => copyWith(color: ComColors.black900);
  TextStyle get black1000 => copyWith(color: ComColors.black1000);

  // this group of success colors is equal to Colors.green
  TextStyle get green100 => copyWith(color: ComColors.green100);
  TextStyle get green200 => copyWith(color: ComColors.green200);
  TextStyle get green300 => copyWith(color: ComColors.green300);
  TextStyle get green400 => copyWith(color: ComColors.green400);
  TextStyle get green500 => copyWith(color: ComColors.green500);
  TextStyle get green600 => copyWith(color: ComColors.green600);
  TextStyle get green700 => copyWith(color: ComColors.green700);
  TextStyle get green800 => copyWith(color: ComColors.green800);
  TextStyle get green900 => copyWith(color: ComColors.green900);
  TextStyle get green1000 => copyWith(color: ComColors.green1000);

  // this grupo warning colors is same to Colors.orange
  TextStyle get oran100 => copyWith(color: ComColors.oran100);
  TextStyle get oran200 => copyWith(color: ComColors.oran200);
  TextStyle get oran300 => copyWith(color: ComColors.oran300);
  TextStyle get oran400 => copyWith(color: ComColors.oran400);
  TextStyle get oran500 => copyWith(color: ComColors.oran500);
  TextStyle get oran600 => copyWith(color: ComColors.oran600);
  TextStyle get oran700 => copyWith(color: ComColors.oran700);
  TextStyle get oran800 => copyWith(color: ComColors.oran800);
  TextStyle get oran900 => copyWith(color: ComColors.oran900);
  TextStyle get oran1000 => copyWith(color: ComColors.oran1000);

  // this grupo error colors is same to Colors.red
  TextStyle get red100 => copyWith(color: ComColors.red100);
  TextStyle get red200 => copyWith(color: ComColors.red200);
  TextStyle get red300 => copyWith(color: ComColors.red300);
  TextStyle get red400 => copyWith(color: ComColors.red400);
  TextStyle get red500 => copyWith(color: ComColors.red500);
  TextStyle get red600 => copyWith(color: ComColors.red600);
  TextStyle get red700 => copyWith(color: ComColors.red700);
  TextStyle get red800 => copyWith(color: ComColors.red800);
  TextStyle get red900 => copyWith(color: ComColors.red900);
  TextStyle get red1000 => copyWith(color: ComColors.red1000);

  // this grupo information colors is same to Colors.blue
  TextStyle get blue100 => copyWith(color: ComColors.blue100);
  TextStyle get blue200 => copyWith(color: ComColors.blue200);
  TextStyle get blue300 => copyWith(color: ComColors.blue300);
  TextStyle get blue400 => copyWith(color: ComColors.blue400);
  TextStyle get blue500 => copyWith(color: ComColors.blue500);
  TextStyle get blue600 => copyWith(color: ComColors.blue600);
  TextStyle get blue700 => copyWith(color: ComColors.blue700);
  TextStyle get blue800 => copyWith(color: ComColors.blue800);
  TextStyle get blue900 => copyWith(color: ComColors.blue900);
  TextStyle get blue1000 => copyWith(color: ComColors.blue1000);

  // this grupo grayscale colors is same to Colors.gray
  TextStyle get white => copyWith(color: ComColors.white);
  TextStyle get white100 => copyWith(color: ComColors.white100);
  TextStyle get white200 => copyWith(color: ComColors.white200);
  TextStyle get white300 => copyWith(color: ComColors.white300);
  TextStyle get white400 => copyWith(color: ComColors.white400);
  TextStyle get white500 => copyWith(color: ComColors.white500);
  TextStyle get white600 => copyWith(color: ComColors.white600);
  TextStyle get white700 => copyWith(color: ComColors.white700);
  TextStyle get white800 => copyWith(color: ComColors.white800);
  TextStyle get white900 => copyWith(color: ComColors.white900);
  TextStyle get white1000 => copyWith(color: ComColors.white1000);
}

abstract class ComTextStyle {
  static TextStyle displayXL = textStyleFurious.copyWith(
    fontSize: _display96Size,
    fontWeight: FontWeight.w400,
  );

  static TextStyle displayM = textStyleFurious.copyWith(
    fontSize: _display64Size,
    fontWeight: FontWeight.w400,
  );
  static TextStyle displayS = textStyleFurious.copyWith(
    fontSize: _display36Size,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h1 = textStyle.copyWith(
    fontSize: _display96Size,
    fontWeight: FontWeight.w800,
  );

  static TextStyle h2 = textStyle.copyWith(
    fontSize: _display60Size,
    fontWeight: FontWeight.w800,
  );
  static TextStyle h3 = textStyle.copyWith(
    fontSize: _display48Size,
    fontWeight: FontWeight.w800,
  );
  static TextStyle h4 = textStyle.copyWith(
    fontSize: _display34Size,
    fontWeight: FontWeight.w800,
  );
  static TextStyle h5 = textStyle.copyWith(
    fontSize: _display24Size,
    fontWeight: FontWeight.w900,
  );
  static TextStyle h6 = textStyle.copyWith(
    fontSize: _display20Size,
    fontWeight: FontWeight.w900,
  );
  static TextStyle subtitle1 = textStyle.copyWith(
    fontSize: _display16Size,
    fontWeight: FontWeight.w700,
  );
  static TextStyle subtitle2 = textStyle.copyWith(
    fontSize: _display14Size,
    fontWeight: FontWeight.w800,
  );
  static TextStyle body1 = textStyle.copyWith(
    fontSize: _display16Size,
    fontWeight: FontWeight.w500,
  );
  static TextStyle body2 = textStyle.copyWith(
    fontSize: _display14Size,
    fontWeight: FontWeight.w500,
  );
  static TextStyle body3 = textStyle.copyWith(
    fontSize: _display13Size,
    fontWeight: FontWeight.w500,
  );
  static TextStyle button1 = textStyle.copyWith(
    fontSize: _display14Size,
    fontWeight: FontWeight.w700,
  );
  static TextStyle button2 = textStyle.copyWith(
    fontSize: _display16Size,
    fontWeight: FontWeight.w700,
  );
  static TextStyle overline = textStyle.copyWith(
    fontSize: _display10Size,
    fontWeight: FontWeight.w400,
  );
  static TextStyle caption = textStyle.copyWith(
    fontSize: _display12Size,
    fontWeight: FontWeight.w500,
  );
  static TextStyle tinyCaption = textStyle.copyWith(
    fontSize: _display10Size,
    fontWeight: FontWeight.w600,
  );
}
