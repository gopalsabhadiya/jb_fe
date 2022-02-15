import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AppChip extends StatelessWidget {
  final String _text;
  final IconData? _icon;
  final VoidCallback? onDeleted;
  const AppChip({
    Key? key,
    required text,
    icon,
    this.onDeleted,
  })  : _text = text,
        _icon = icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      deleteIcon: const MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Icon(
          Icons.close,
          color: AppColors.grey_4,
        ),
      ),
      useDeleteButtonTooltip: false,
      onDeleted: onDeleted,
      avatar: _icon != null
          ? CircleAvatar(
              backgroundColor: AppColors.white,
              child: Icon(
                _icon,
                color: AppColors.blue_5,
              ),
            )
          : null,
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      label: AppTextBuilder(_text).color(AppColors.blue_5).build(),
      backgroundColor: AppColors.blue_1,
      shadowColor: AppColors.black,
      elevation: 5,
    );
  }
}
