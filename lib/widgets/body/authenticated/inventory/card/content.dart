import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/image_content.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class InventoryCardContent extends StatelessWidget {
  final ItemPresentation _item;

  const InventoryCardContent({Key? key, required item})
      : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ItemImageContent(),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: AppColors.whiteWithOpacity(0.6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextBuilder(_item.huid ?? DefaultTexts.NULL_STRING)
                      .size(14)
                      .color(_item.huid != null
                          ? AppColors.blue_5
                          : AppColors.red_2)
                      .build(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTextBuilder(_item.grossWeight.toStringAsFixed(3))
                          .size(14)
                          .color(AppColors.blue_5)
                          .build(),
                      AppTextBuilder("GM")
                          .size(10)
                          .color(AppColors.blue_5)
                          .build()
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.layers,
                        color: AppColors.blue_5,
                      ),
                      AppTextBuilder((_item.newStockPieces - _item.cartQuantity)
                              .toString())
                          .size(14)
                          .color(AppColors.blue_5)
                          .build(),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
