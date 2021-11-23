import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/side_panel.dart';

class AppBodyAuthenticated extends StatelessWidget {
  const AppBodyAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        !ScreenSizeUtil.displayDrawer(context) ? SidePanel() : Container(),
        Container(
          color: AppColors.grey_1,
        )
      ],
    );
  }
}
