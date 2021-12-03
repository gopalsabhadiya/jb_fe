import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AppChip extends StatelessWidget {
  final String _text;
  final IconData? _icon;
  const AppChip({Key? key, required text, required icon})
      : _text = text,
        _icon = icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: AppColors.white,
        child: Icon(
          _icon,
          color: AppColors.blue_5,
        ),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      label: AppTextBuilder(_text).color(AppColors.blue_5).build(),
      backgroundColor: AppColors.blue_1,
      shadowColor: AppColors.black,
      elevation: 5,
    );
  }
}
