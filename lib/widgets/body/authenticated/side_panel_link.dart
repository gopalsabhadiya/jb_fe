import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class SidePanelLink extends StatelessWidget {
  final IconData _icon;
  final String _text;
  final bool _isActive;
  const SidePanelLink({Key? key, required icon, required text, isActive})
      : _icon = icon,
        _text = text,
        _isActive = isActive ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.screenWidth(context) < 1200
        ? SizedBox(
            width: double.maxFinite,
            child: Column(
              children: _getContent(context),
            ),
          )
        : Row(children: _getContent(context));
  }

  _getContent(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Icon(
          _icon,
          size: 30,
          color: _isActive ? AppColors.blue_5 : AppColors.grey_3,
        ),
      ),
      AppTextBuilder(_text)
          .size(16 + ScreenSizeUtil.getWidthAdditionForDrawerUI(context, 2))
          .color(_isActive ? AppColors.blue_5 : AppColors.grey_3)
          .weight(_isActive ? AppFontWeight.BOLD : AppFontWeight.LIGHT)
          .build(),
    ];
  }
}
