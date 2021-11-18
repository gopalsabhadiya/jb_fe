import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/contact_us.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/unauthenticated/contact_us/query_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/svg/logo_svg.dart';

class AppContactUs extends StatelessWidget {
  const AppContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_4,
      child: Padding(
        padding: EdgeInsets.all(ScreenSizeUtil.getContentPadding(context)),
        child: Wrap(
          spacing: ScreenSizeUtil.getWidthWidthAddition(context, 50),
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoSVG(),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.call,
                      color: AppColors.blue_2,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AppTextBuilder(ContactUsText.MOBILE_NUMBER)
                        .color(AppColors.grey_1)
                        .size(16)
                        .build(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.email,
                      color: AppColors.blue_2,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AppTextBuilder(ContactUsText.EMIAL_ADDRESS)
                        .color(AppColors.grey_1)
                        .size(16)
                        .build(),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [QueryForm()],
            ),
          ],
        ),
      ),
    );
  }
}
