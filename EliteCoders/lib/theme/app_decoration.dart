import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray20003,
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blueGray900,
      );

  static BoxDecoration get fillIndigo => BoxDecoration(
    color: appTheme.indigo900,
  );

  // Outline decorations
  static BoxDecoration get outlineBlackF => BoxDecoration(
    color: appTheme.gray300,
    boxShadow: [
      BoxShadow(
        color: appTheme.black9003f,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlue => BoxDecoration(
    border: Border.all(
      color: appTheme.blue400,
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineIndigo => BoxDecoration(
    border: Border.all(
      color: appTheme.indigo900,
      width: 2.h,
    ),
  );
  // Fill decorations

  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
    color: theme.colorScheme.primaryContainer,
  );

  // Outline decorations
  static BoxDecoration get outlinePrimaryContainer => BoxDecoration(
    border: Border.all(
      color: theme.colorScheme.primaryContainer,
      width: 2.h,
    ),
  );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    color: appTheme.blueGray100,
    border: Border.all(
      color: appTheme.blueGray90001,
      width: 1.h,
      strokeAlign: strokeAlignOutside,
    ),
  );
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder25 => BorderRadius.circular(
        25.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder14 => BorderRadius.circular(
        14.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder55 => BorderRadius.circular(
        55.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder11 => BorderRadius.circular(
    11.h,
  );

  static BorderRadius get roundedBorder5 => BorderRadius.circular(
    5.h,
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
