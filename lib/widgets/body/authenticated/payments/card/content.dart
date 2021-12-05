import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class PaymentCardContent extends StatelessWidget {
  const PaymentCardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 250, maxHeight: 250),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  AppIcons.id,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("10")
                  .size(16)
                  .textAlign(TextAlign.right)
                  .weight(AppFontWeight.BOLD)
                  .build()
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  AppIcons.rupee,
                  color: AppColors.blue_5,
                ),
              ),
              Expanded(
                child: AppTextBuilder("75,000")
                    .size(16)
                    .textAlign(TextAlign.right)
                    .build(),
              )
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.date_range,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("22, Oct 2021")
                  .size(16)
                  .textAlign(TextAlign.right)
                  .build()
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.credit_card,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("CASH").size(16).build()
            ]),
            Container(
              color: AppColors.grey_2,
              constraints: BoxConstraints(minHeight: 2),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.call,
                  color: AppColors.blue_5,
                ),
              ),
              AppTextBuilder("+91 8000523940").size(16).build()
            ]),
          ],
        ),
      ),
    );
  }
}
