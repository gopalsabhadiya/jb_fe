import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/util/date_util.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class OrderFormMidSection extends StatelessWidget {
  final OrderPresentation _order;
  const OrderFormMidSection({Key? key, required OrderPresentation order})
      : _order = order,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    AppTextBuilder(OrderText.GOLD_RATE)
                        .color(AppColors.blue_5)
                        .size(16)
                        .paddingVertical(5)
                        .build(),
                    AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                            DefaultTexts.SPACE +
                            _order.goldRate.toString())
                        .weight(AppFontWeight.BOLD)
                        .color(AppColors.red_2)
                        .build()
                  ],
                ),
              ),
              AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                      DefaultTexts.SPACE +
                      _order.billOutstanding.toString())
                  .weight(FontWeight.bold)
                  .size(25)
                  .color(AppColors.blue_5)
                  .build(),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    const Icon(
                      Icons.event,
                      size: 25,
                      color: AppColors.blue_5,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AppTextBuilder(DateUtil.dateToString(_order.date))
                        .weight(AppFontWeight.BOLD)
                        .color(AppColors.blue_5)
                        .build()
                  ],
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
                  AppTextBuilder("₹ 1,500")
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
                  AppTextBuilder("₹ 1,500")
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
              Column(
                children: [
                  AppTextBuilder(OrderText.PAID)
                      .color(AppColors.blue_5)
                      .size(16)
                      .paddingVertical(5)
                      .build(),
                  AppTextBuilder("₹ 10,000")
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.green_1)
                      .build()
                ],
              ),
              Column(
                children: [
                  AppTextBuilder(OrderText.DUE)
                      .color(AppColors.blue_5)
                      .size(16)
                      .paddingVertical(5)
                      .build(),
                  AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                          DefaultTexts.SPACE +
                          _order.billOutstanding.toString())
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.red_2)
                      .build()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _onChange(String input) {
    print("Assign Item med section input on change");
  }
}
