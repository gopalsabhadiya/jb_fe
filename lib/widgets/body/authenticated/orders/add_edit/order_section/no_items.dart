import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class NoItems extends StatelessWidget {
  final VoidCallback _closeDrawer;
  const NoItems({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _closeDrawer,
      child: Container(
        color: AppColors.blue_1,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              AppTextBuilder("No items in the cart, Please select items first")
                  .color(AppColors.red_2)
                  .weight(AppFontWeight.BOLD)
                  .build(),
        ),
      ),
    );
  }
}
