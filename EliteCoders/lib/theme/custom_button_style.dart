import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillOnPrimaryContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              26.h,
            ),
            topRight: Radius.circular(
              26.h,
            ),
            bottomLeft: Radius.circular(
              26.h,
            ),
            bottomRight: Radius.circular(
              26.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );

  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      );

  static ButtonStyle get fillLightBlueE => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightBlue600E2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              26.h,
            ),
            topRight: Radius.circular(
              26.h,
            ),
            bottomLeft: Radius.circular(
              26.h,
            ),
            bottomRight: Radius.circular(
              26.h,
            ),
          ),
        ),
      );

  static ButtonStyle get fillLightBlue => ElevatedButton.styleFrom(
    backgroundColor: appTheme.lightBlue50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
  );

  // Outline button style
  static ButtonStyle get outlineIndigoTL18 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: appTheme.indigo900,
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.h),
    ),
  );
  static ButtonStyle get outlineLightBlue => OutlinedButton.styleFrom(
    backgroundColor: appTheme.lightBlue50,
    side: BorderSide(
      color: appTheme.lightBlue50,
      width: 2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
  );
  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blue50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
  );

  static ButtonStyle get fillPrimaryContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primaryContainer.withOpacity(1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
  );

}
