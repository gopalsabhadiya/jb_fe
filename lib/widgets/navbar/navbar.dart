import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/navbar/content/navbar_content.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: NavbarContent(
              navbarType: ScreenSizeUtil.getNavbarType(context),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: AppColors.grey_3.withOpacity(0.5),
            blurRadius: 15.0,
            offset: const Offset(0.0, 0.75))
      ], color: AppColors.white),
    );
  }
}
