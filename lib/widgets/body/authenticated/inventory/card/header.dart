import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/calligraphy/text_marquee.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

class ItemCardHeader extends StatelessWidget {
  final ItemPresentation _item;
  const ItemCardHeader({Key? key, required item})
      : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 50, maxWidth: 250, maxHeight: 50),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppTextMarquee(
              child: AppTextBuilder(_item.name)
                  .weight(AppFontWeight.BOLD)
                  .size(16)
                  .color(AppColors.blue_5)
                  .build(),
            ),
          ),
          Row(
            children: [
              AppIconButtonBuilder(Icons.add_shopping_cart)
                  .size(25)
                  .color(AppColors.blue_5)
                  .padding(const EdgeInsets.symmetric(horizontal: 5))
                  .build(),
              AppIconButtonBuilder(Icons.share)
                  .size(25)
                  .color(AppColors.blue_5)
                  .build()
            ],
          )
        ],
      ),
    );
  }
}
