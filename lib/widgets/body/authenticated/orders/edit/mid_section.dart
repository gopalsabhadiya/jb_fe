import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class OrderFormMidSection extends StatelessWidget {
  const OrderFormMidSection({Key? key}) : super(key: key);

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
                child: AppTextInput(
                    prefixIcon: Icons.category,
                    hint: ItemText.CATEGORY_INPUT_TEXT,
                    onChanged: _onChange),
              ),
              AppTextBuilder("₹ 1,03,000")
                  .weight(FontWeight.bold)
                  .size(25)
                  .color(AppColors.blue_5)
                  .build(),
              SizedBox(
                width: 300,
                child: AppTextInput(
                    prefixIcon: Icons.category,
                    hint: ItemText.TYPE_INPUT_TEXT,
                    onChanged: _onChange),
              ),
            ],
          ),
          SizedBox(
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
                  AppTextBuilder("₹ 10,300")
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
                  AppTextBuilder("₹ 1,03,000")
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
                  AppTextBuilder("₹ 50,00")
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
                  AppTextBuilder("₹ 43,000")
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
