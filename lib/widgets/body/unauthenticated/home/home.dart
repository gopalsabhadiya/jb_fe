import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/home_texts.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/svg/book_svg.dart';

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(ScreenSizeUtil.getContentPadding(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 20 +
                          ScreenSizeUtil.getWidthWidthAddition(context, 60)),
                  child: const BookSVG(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:
                      300 + ScreenSizeUtil.getWidthWidthAddition(context, 550),
                  child: AppTextBuilder(HomeTexts.HEADING)
                      .size(18 +
                          ScreenSizeUtil.getWidthWidthAddition(context, 10))
                      .weight(FontWeight.bold)
                      .build(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:
                      300 + ScreenSizeUtil.getWidthWidthAddition(context, 350),
                  child: AppTextBuilder(HomeTexts.SUB_HEADING)
                      .opacity(0.6)
                      .size(
                          16 + ScreenSizeUtil.getWidthWidthAddition(context, 2))
                      .paddingAll(10)
                      .build(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
