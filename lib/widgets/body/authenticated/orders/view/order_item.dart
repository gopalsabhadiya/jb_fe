import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/constants/enum/labour_type_enum.dart';
import 'package:jb_fe/backend_integration/dto/item/item_extra_presentation.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/chip.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class OrderFormItemDetails extends StatelessWidget {
  final ItemPresentation _item;
  const OrderFormItemDetails({Key? key, required ItemPresentation item})
      : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.grey_1,
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
                AppTextBuilder(_item.name)
                    .color(AppColors.blue_5)
                    .weight(AppFontWeight.BOLD)
                    .paddingAll(10)
                    .size(16)
                    .build(),
                AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                        DefaultTexts.SPACE +
                        _item.newNetAmount.toStringAsFixed(2))
                    .color(AppColors.red_2)
                    .weight(AppFontWeight.BOLD)
                    .paddingAll(10)
                    .size(16)
                    .build(),
                Row(
                  children: [
                    AppTextBuilder(_item.huid ?? DefaultTexts.EMPTY)
                        .color(AppColors.blue_5)
                        .weight(AppFontWeight.BOLD)
                        .paddingAll(10)
                        .size(16)
                        .build(),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppChip(
                          text: _item.grossWeight.toString(),
                          icon: AppIcons.gross_weight),
                      AppChip(
                          text: _item.netWeight.toString(),
                          icon: AppIcons.net_weight),
                      AppChip(
                          text: _item.carat != null
                              ? _item.carat.toString()
                              : DefaultTexts.NULL_STRING,
                          icon: AppIcons.karat),
                      _item.labour != null
                          ? AppChip(
                              text: _item.labour!.value.toString() +
                                  DefaultTexts.SPACE +
                                  _item.labour!.type.name(),
                              icon: Icons.engineering)
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _getItemExtras(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getItemExtras() {
    List<Widget> itemExtras = <Widget>[];
    for (final ItemExtraPresentation iep in _item.extras!) {
      itemExtras.add(
        KeyValueDisplay(
          textKey: iep.type,
          value: DefaultTexts.RUPEE_SYMBOL +
              DefaultTexts.SPACE +
              iep.amount.toString(),
        ),
      );
    }
    return itemExtras;
  }
}
