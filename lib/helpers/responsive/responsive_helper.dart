import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/enum/screen.dart';

class ResponsiveHelper {
  static const int largeScreenSize = 1366;
  static const int mediumScreenSize = 768;
  static const int smallScreenSize = 360;

  static ScreenSize getScreenSize(BuildContext context) {
    if (MediaQuery.of(context).size.width >= largeScreenSize) {
      return ScreenSize.LARGE_SCREEN;
    } else if (MediaQuery.of(context).size.width >= mediumScreenSize) {
      return ScreenSize.MEDIUM_SCREEN;
    } else {
      return ScreenSize.SMALL_SCREEN;
    }
  }

  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
