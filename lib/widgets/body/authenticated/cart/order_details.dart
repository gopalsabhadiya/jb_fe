import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button_circle.dart';
import 'package:jb_fe/widgets/common/chip.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 1000),
      decoration: BoxDecoration(
        color: AppColors.blue_1,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.grey_2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextBuilder("Gold Earring")
                      .color(AppColors.blue_5)
                      .weight(AppFontWeight.BOLD)
                      .paddingAll(10)
                      .size(16)
                      .build(),
                  AppTextBuilder("₹ 25,000")
                      .color(AppColors.red_2)
                      .weight(AppFontWeight.BOLD)
                      .paddingAll(10)
                      .size(16)
                      .build(),
                  Row(
                    children: [
                      AppTextBuilder("JHFG654KLJH")
                          .color(AppColors.blue_5)
                          .weight(AppFontWeight.BOLD)
                          .paddingAll(10)
                          .size(16)
                          .build(),
                      IconButton(
                        onPressed: () => print("Remove item"),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.red_2,
                          size: 25,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppChip(text: "4.500", icon: AppIcons.gross_weight),
                  AppChip(text: "4.500", icon: AppIcons.net_weight),
                  AppChip(text: "24", icon: AppIcons.karat),
                  AppChip(text: "400", icon: Icons.engineering),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  KeyValueDisplay(
                    textKey: OrderText.DIAMOND,
                    value: "₹ 250",
                  ),
                  KeyValueDisplay(
                    textKey: OrderText.RHODIUM,
                    value: "₹ 150",
                  ),
                  KeyValueDisplay(
                    textKey: OrderText.HALL_MARK,
                    value: "₹ 200",
                  ),
                  KeyValueDisplay(
                    textKey: OrderText.RUBY,
                    value: "₹ 2,500",
                  ),
                  KeyValueDisplay(
                    textKey: OrderText.STONE,
                    value: "₹ 50",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.blue_2,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Row(
                      children: [
                        AppIconButtonCircleBuilder(Icons.add)
                            .backgroundColor(AppColors.green_1)
                            .padding(const EdgeInsets.all(5))
                            .color(AppColors.grey_1)
                            .build(),
                        AppTextBuilder("1")
                            .paddingHorizontal(10)
                            .weight(AppFontWeight.BOLD)
                            .build(),
                        AppIconButtonCircleBuilder(Icons.remove)
                            .backgroundColor(AppColors.red_2)
                            .padding(const EdgeInsets.all(5))
                            .color(AppColors.grey_1)
                            .build(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
