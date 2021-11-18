import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class CapsulePair extends StatelessWidget {
  final String bigCapsuleText;
  final String smallCapsuleText;

  const CapsulePair(
      {Key? key, required this.bigCapsuleText, required this.smallCapsuleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const ShapeDecoration(
              color: AppColors.blue_5, shape: StadiumBorder()),
          child: AppTextBuilder(bigCapsuleText)
              .color(AppColors.grey_1)
              .weight(AppFontWeight.SEMI_BOLD)
              .paddingHorizontalVertical(
                  paddingHorizontal: 50, paddingVertical: 15)
              .build(),
        ),
        Container(
          decoration: const ShapeDecoration(
              color: AppColors.blue_2, shape: StadiumBorder()),
          child: AppTextBuilder(smallCapsuleText)
              .color(AppColors.blue_5)
              .size(16)
              .weight(AppFontWeight.SEMI_BOLD)
              .paddingHorizontalVertical(
                  paddingHorizontal: 50, paddingVertical: 8)
              .build(),
        )
      ],
    );
  }
}
