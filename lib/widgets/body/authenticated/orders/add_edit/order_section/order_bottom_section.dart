import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/order/new_order/add_order_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class OrderBottomSection extends StatelessWidget {
  final OrderPresentation _order;
  const OrderBottomSection({Key? key, required order})
      : _order = order,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppTextBuilder("Scrap Details:")
                        .color(AppColors.blue_5)
                        .weight(AppFontWeight.BOLD)
                        .build(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextInput(
                        initialValue: _order.scrap != null &&
                                _order.scrap!.netAmmount != 0
                            ? _order.scrap!.netWeight.toStringAsFixed(3)
                            : DefaultTexts.EMPTY,
                        prefixIcon: AppIcons.net_weight,
                        hint: OrderText.SCRAP_NET_WEIGHT_INPUT,
                        onChanged: _order.scrap!.setNetWeight,
                        validator: _order.scrap!.netWeightValidator,
                        isNumberInput: true,
                        onRemoveFocus: () =>
                            BlocProvider.of<AddOrderBloc>(context)
                                .add(UpdateScrapAndKasar()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: AppTextInput(
                        initialValue: _order.scrap!.touch != 0
                            ? _order.scrap!.touch.toStringAsFixed(3)
                            : DefaultTexts.EMPTY,
                        prefixIcon: AppIcons.percent,
                        hint: OrderText.SCRAP_TOUCH_INPUT,
                        onChanged: _order.scrap!.setTouch,
                        validator: _order.scrap!.touchValidator,
                        isNumberInput: true,
                        onRemoveFocus: () =>
                            BlocProvider.of<AddOrderBloc>(context)
                                .add(UpdateScrapAndKasar()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppTextBuilder("Discount (Kasar):")
                        .color(AppColors.blue_5)
                        .weight(AppFontWeight.BOLD)
                        .build(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextInput(
                        prefixIcon: AppIcons.rupee,
                        hint: OrderText.KASAR_INPUT,
                        onChanged: _order.setKasar,
                        initialValue: _order.kasar != 0
                            ? _order.kasar!.toStringAsFixed(2)
                            : DefaultTexts.EMPTY,
                        // validator: _order.scrap.touchValidator,
                        isNumberInput: true,
                        onRemoveFocus: () =>
                            BlocProvider.of<AddOrderBloc>(context)
                                .add(UpdateScrapAndKasar()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
