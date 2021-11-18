import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';

class AppDecorations {
  static BoxDecoration noOffset() {
    return const BoxDecoration(boxShadow: [
      BoxShadow(
          color: AppColors.grey_2,
          offset: Offset(0, 0),
          blurRadius: 15,
          spreadRadius: 3),
    ]);
  }

  static BoxDecoration withOffset() {
    return const BoxDecoration(boxShadow: [
      BoxShadow(
          color: AppColors.grey_4,
          offset: Offset(5, 6),
          blurRadius: 20,
          spreadRadius: -10)
    ]);
  }
}
