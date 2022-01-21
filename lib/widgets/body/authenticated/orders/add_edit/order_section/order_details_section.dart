import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/dashboard.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/date_picker.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class OrderDetailsSectionInCart extends StatelessWidget {
  final OrderPresentation _order;
  const OrderDetailsSectionInCart({Key? key, required order})
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
                  onChanged: _order.setGoldRate,
                  initialValue: _order.goldRate!.toStringAsFixed(3),
                  isNumberInput: true,
                  validator: _order.goldRateValidator,
                  onRemoveFocus: () =>
                      BlocProvider.of<AddOrderBloc>(context).add(
                    AddGoldRate(
                      goldRate: _order.goldRate!,
                    ),
                  ),
                ),
              ),
              AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                      DefaultTexts.SPACE +
                      _order.finalAmmount.toStringAsFixed(2))
                  .weight(FontWeight.bold)
                  .size(25)
                  .color(AppColors.blue_5)
                  .build(),
              SizedBox(
                width: 300,
                // child: AppTextInput(
                //   prefixIcon: Icons.today,
                //   hint: ItemText.TYPE_INPUT_TEXT,
                //   onChanged: (String value) => print("Dumbo"),
                // ),
                child: AppDatePicker(
                  prefixIcon: Icons.today,
                  hint: ItemText.TYPE_INPUT_TEXT,
                  onSetValue: _order.setDate,
                  initialValue: _order.date,
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
                          _order.netAmmount.toStringAsFixed(2))
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
                          _order.gst.first.ammount.toStringAsFixed(2))
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
                          _order.gst[1].ammount.toStringAsFixed(2))
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
                          _order.totalAmmount.toStringAsFixed(2))
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
                          _order.scrapAmmount!.toStringAsFixed(2))
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
