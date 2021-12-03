import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/chip.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class OrderFormItemDetails extends StatelessWidget {
  const OrderFormItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 5, right: 5, left: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 3 //edited
                )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.grey_2,
                borderRadius: BorderRadius.circular(5),
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
                          onPressed: _onClick,
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.red_2,
                            size: 25,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppChip(text: "4.500", icon: AppIcons.gross_weight),
                      AppChip(text: "4.500", icon: AppIcons.net_weight),
                      AppChip(text: "24", icon: AppIcons.karat),
                      AppChip(text: "400", icon: Icons.engineering),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      KeyValueDisplay(
                        textKey: OrderText.DIAMOND,
                        value: "₹ 250",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      KeyValueDisplay(
                        textKey: OrderText.RHODIUM,
                        value: "₹ 150",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      KeyValueDisplay(
                        textKey: OrderText.HALL_MARK,
                        value: "₹ 200",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      KeyValueDisplay(
                        textKey: OrderText.RUBY,
                        value: "₹ 2,500",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      KeyValueDisplay(
                        textKey: OrderText.STONE,
                        value: "₹ 50",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.blue_1,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: _onClick,
                              icon: const Icon(
                                Icons.add_circle,
                                color: AppColors.green_1,
                                size: 25,
                              ),
                            ),
                            AppTextBuilder("1").paddingHorizontal(10).build(),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: _onClick,
                              icon: const Icon(
                                Icons.remove_circle,
                                color: AppColors.red_2,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onChange(String value) {
    print("Input Changed");
  }

  void _onClick() {
    print("Close Clicked");
  }
}
