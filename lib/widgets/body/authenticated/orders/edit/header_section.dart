import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class OrderFormHeader extends StatelessWidget {
  const OrderFormHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.grey_2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle,
                      size: 35, color: AppColors.blue_5),
                ),
                AppTextBuilder("Gopal Sabhadiya")
                    .weight(AppFontWeight.BOLD)
                    .color(AppColors.blue_5)
                    .build(),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                  size: 25,
                  color: AppColors.blue_5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextBuilder("+91 8000523940")
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.blue_5)
                      .build(),
                ),
              ],
            )
          ],
        ));
  }
}
