import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/navbar_types_enum.dart';
import 'package:jb_fe/constants/enum/screen_size_enum.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';

class ScreenSizeUtil {
  static double getBookSVGHeightFactor(BuildContext context) {
    switch (ResponsiveHelper.getScreenSize(context)) {
      case ScreenSize.LARGE_SCREEN:
        return 0.30;
      case ScreenSize.MEDIUM_SCREEN:
        return 0.25;
      case ScreenSize.SMALL_SCREEN:
        return 0.15;
      default:
        return 0.35;
    }
  }

  static double getNavbarMiddlePadding(BuildContext context) {
    switch (ResponsiveHelper.getScreenSize(context)) {
      case ScreenSize.LARGE_SCREEN:
        return ResponsiveHelper.screenWidth(context) / 6;
      case ScreenSize.MEDIUM_SCREEN:
        return ResponsiveHelper.screenWidth(context) / 10;
      default:
        return 0;
    }
  }

  static double getNavbarLogoHeightFactor(BuildContext context) {
    switch (ResponsiveHelper.getScreenSize(context)) {
      case ScreenSize.LARGE_SCREEN:
        return 1;
      case ScreenSize.MEDIUM_SCREEN:
        return 0.8;
      case ScreenSize.SMALL_SCREEN:
        return 0.6;
      default:
        return 0;
    }
  }

  static double getNavbarLinkFontSize(BuildContext context) {
    switch (ResponsiveHelper.getScreenSize(context)) {
      case ScreenSize.LARGE_SCREEN:
        return 18;
      case ScreenSize.MEDIUM_SCREEN:
        return 16;
      case ScreenSize.SMALL_SCREEN:
        return 16;
      default:
        return 18;
    }
  }

  static NavbarTypes getNavbarType(BuildContext context) {
    if (context.read<AuthenticationBloc>().state ==
        AuthenticationState.SUCCESS) {
      if (ResponsiveHelper.screenWidth(context) < 809) {
        return NavbarTypes.REGULAR_TOP_AUTHENTICATED;
      }
      return NavbarTypes.SIDE_HAMBURGER_AUTHENTICATED;
    }
    if (ResponsiveHelper.screenWidth(context) < 809) {
      return NavbarTypes.SIDE_HAMBURGER_UNAUTHENTICATED;
    }
    return NavbarTypes.REGULAR_TOP_UNAUTHENTICATED;
  }

  static double getContentPadding(BuildContext context) {
    switch (ResponsiveHelper.getScreenSize(context)) {
      case ScreenSize.SMALL_SCREEN:
        return 20;
      case ScreenSize.MEDIUM_SCREEN:
        return 50;
      case ScreenSize.LARGE_SCREEN:
        return 120;
    }
  }

  static double getWidthWidthAddition(BuildContext context, double sizeMargin) {
    double screenWidth = ResponsiveHelper.screenWidth(context);
    if (screenWidth > 1365) {
      return sizeMargin;
    } else if (screenWidth < 350) {
      return 0;
    } else {
      return sizeMargin *
          ((ResponsiveHelper.screenWidth(context) - 350) / (1015));
    }
  }

  static double getSidePadding(BuildContext context, double factor) {
    double screenWidth = ResponsiveHelper.screenWidth(context);
    if (screenWidth <= factor) {
      return 0;
    } else {
      return (screenWidth - factor) / 2;
    }
  }
}
