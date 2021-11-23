import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';
import 'package:jb_fe/widgets/svg/logo_svg.dart';

class RegularTopAuthenticatedNavbar extends StatelessWidget {
  const RegularTopAuthenticatedNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int counter = 1;

    void _accountOnClickHandler() {
      if (AppGlobalKeys.AUTH_BODY_SCAFFOLD.currentState!.isEndDrawerOpen) {
        Navigator.pop(context);
      } else {
        AppGlobalKeys.AUTH_BODY_SCAFFOLD.currentState!.openEndDrawer();
      }
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoSVG(),
          SizedBox(
            width: 50 + ScreenSizeUtil.getWidthWidthAddition(context, 800),
          ),
          Row(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  AppIconButtonBuilder(Icons.notifications)
                      .size(30)
                      .color(AppColors.blue_5)
                      .padding(EdgeInsets.only(left: 8, right: 8))
                      .build(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.red_1,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      constraints: const BoxConstraints(
                        maxHeight: 16,
                        maxWidth: 16,
                      ),
                      child: AppTextBuilder("5")
                          .size(10)
                          .weight(AppFontWeight.BOLD)
                          .color(AppColors.grey_1)
                          .build(),
                    ),
                  )
                ],
              ),
              AppIconButtonBuilder(Icons.shopping_cart)
                  .size(30)
                  .color(AppColors.blue_5)
                  .padding(EdgeInsets.only(left: 8, right: 8))
                  .build(),
              AppIconButtonBuilder(Icons.account_circle)
                  .size(30)
                  .color(AppColors.blue_5)
                  .padding(const EdgeInsets.only(left: 8, right: 8))
                  .onClickHandler(_accountOnClickHandler)
                  .build(),
            ],
          )
        ],
      ),
    );
  }
}
