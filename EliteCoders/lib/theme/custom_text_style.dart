import 'package:flutter/material.dart';
import 'package:educonsult/core/utils/size_utils.dart';
import 'package:educonsult/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineLargeSemiBold => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleLargePrimaryContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray800,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumBlue900 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.blue900,
  );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.whiteA700,
  );
  // Title text style
  static get titleLargeBluegray40001 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.blueGray40001,
    fontWeight: FontWeight.w400,
  );
  static get titleLargeBluegray900 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.blueGray900,
    fontWeight: FontWeight.w600,
  );
  static get titleLargePoppinsBluegray900 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.blueGray900,
        fontSize: 22.fSize,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray900,
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
  );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
    fontSize: 16.fSize,
  );
  static get titleMediumInterBluegray900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.blueGray900.withOpacity(0.66),
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterGray200 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray200,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterGray20002 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray20002,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterOnErrorContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w500,
      );

  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 8.fSize,
  );
  // Label text style
  static get labelLargeGray90001 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray90001,
  );
  static get labelMediumPoppinsGray800 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.gray800,
      );
  static get labelMediumPoppinsWhiteA700 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontSize: 7.fSize,
      );
  // Title text style
  static get titleLargeGray900 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.gray900,
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
  );
  static get titleMediumIndigo900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.indigo900,
    fontSize: 18.fSize,
    fontWeight: FontWeight.w700,
  );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.whiteA700,
  );

  static get titleLargeBluegray90001 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.blueGray90001,
    fontWeight: FontWeight.w600,
  );
  static get titleLargePoppinsGray900 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w400,
      );

  static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueGray900,
    fontSize: 17.fSize,
    fontWeight: FontWeight.w500,
  );

  static get titleMediumGray200 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray200,
    fontSize: 17.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleMediumGray20003 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray20003,
    fontSize: 18.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleMediumPoppinsGray90001 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w600,
      );

  static get bodyMediumGray20002 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray20002,
  );

  static get titleMediumBluegray90001 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueGray90001.withOpacity(0.66),
    fontSize: 18.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleLargeBluegray90001Bold =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }



}
