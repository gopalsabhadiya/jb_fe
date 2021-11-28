import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/location/assets.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class InventoryCardContent extends StatelessWidget {
  const InventoryCardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.white,
          constraints: const BoxConstraints(
              minHeight: 250, maxHeight: 250, minWidth: 250, maxWidth: 250),
          // child: const DiamondSVG(),
          child: const Image(
            image: AssetImage(AssetLocation.BRACELET_1_JPG),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: AppColors.whiteWithOpacity(0.6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextBuilder("KAJF1384KG")
                      .size(14)
                      .color(AppColors.blue_5)
                      .build(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTextBuilder("4.1000")
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
                      Icon(
                        Icons.layers,
                        color: AppColors.blue_5,
                      ),
                      AppTextBuilder("10")
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
