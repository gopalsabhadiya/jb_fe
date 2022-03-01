import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/typography/font_weight.dart';
import '../../../../../util/date_util.dart';
import '../../../../calligraphy/app_text.dart';

class TrialPeriodBottomMessage extends StatelessWidget {
  final DateTime _subscriptionEndDate;
  const TrialPeriodBottomMessage(
      {Key? key, required DateTime subscriptionEndDate})
      : _subscriptionEndDate = subscriptionEndDate,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppTextBuilder(
                "You're using trial period. Your Trial expires on: ",
              ).color(AppColors.red_2).build(),
              AppTextBuilder(
                DateUtil.dateToString(_subscriptionEndDate),
              ).color(AppColors.red_1).weight(AppFontWeight.BOLD).build()
            ],
          ),
          Row(
            children: [
              AppTextBuilder("Contact: ").color(AppColors.blue_5).build(),
              AppTextBuilder("+91 9104197242")
                  .color(AppColors.green_1)
                  .weight(AppFontWeight.BOLD)
                  .build(),
            ],
          )
        ],
      ),
    );
  }
}
