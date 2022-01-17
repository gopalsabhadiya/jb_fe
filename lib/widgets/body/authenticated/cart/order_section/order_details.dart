import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/dashboard.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class OrderDetailsInCart extends StatelessWidget {
  final OrderPresentation _order;
  const OrderDetailsInCart({Key? key, required order})
      : _order = order,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: AppTextInput(
                  prefixIcon: Icons.sell,
                  hint: DashboardText.ADD_DAILY_GOLD_RATE_HINT,
                  tooltip: DashboardText.ADD_DAILY_GOLD_RATE_TOOLTIP,
                  onChanged: (String value) =>
                      print("Set new gold rate for order"),
                  isNumberInput: true,
                  initialValue: _order.goldRate.toString(),
                ),
              ),
              AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                      DefaultTexts.SPACE +
                      _order.finalAmmount.toString())
                  .weight(FontWeight.bold)
                  .size(25)
                  .color(AppColors.blue_5)
                  .build(),
              SizedBox(
                width: 300,
                child: AppTextInput(
                  prefixIcon: Icons.category,
                  hint: ItemText.TYPE_INPUT_TEXT,
                  onChanged: (String value) => print("Dumbo"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AppTextBuilder(OrderText.NET_AMMOUNT)
                      .color(AppColors.blue_5)
                      .size(16)
                      .paddingVertical(5)
                      .build(),
                  AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                          DefaultTexts.SPACE +
                          _order.netAmmount.toString())
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.red_2)
                      .build()
                ],
              ),
              Column(
                children: [
                  AppTextBuilder(OrderText.CGST)
                      .color(AppColors.blue_5)
                      .size(16)
                      .paddingVertical(5)
                      .build(),
                  AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                          DefaultTexts.SPACE +
                          _order.gst.first.ammount.toString())
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.red_2)
                      .build()
                ],
              ),
              Column(
                children: [
                  AppTextBuilder(OrderText.SGST)
                      .color(AppColors.blue_5)
                      .size(16)
                      .paddingVertical(5)
                      .build(),
                  AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                          DefaultTexts.SPACE +
                          _order.gst[1].ammount.toString())
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.red_2)
                      .build()
                ],
              ),
              Column(
                children: [
                  AppTextBuilder(OrderText.TOTAL)
                      .color(AppColors.blue_5)
                      .size(16)
                      .paddingVertical(5)
                      .build(),
                  AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                          DefaultTexts.SPACE +
                          _order.totalAmmount.toString())
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.blue_5)
                      .build()
                ],
              ),
              Column(
                children: [
                  AppTextBuilder(OrderText.SCRAP)
                      .color(AppColors.blue_5)
                      .size(16)
                      .paddingVertical(5)
                      .build(),
                  AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                          DefaultTexts.SPACE +
                          _order.scrapAmmount.toString())
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.green_1)
                      .build()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
