import 'package:flutter/cupertino.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/typography/font_weight.dart';
import '../../../../calligraphy/app_text.dart';

class SubscriptionExpiredMessage extends StatelessWidget {
  const SubscriptionExpiredMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextBuilder(
                "Your Subscription expired, Please contact: ",
              ).color(AppColors.red_2).build(),
              AppTextBuilder("+91 9104197242")
                  .color(AppColors.blue_5)
                  .weight(AppFontWeight.BOLD)
                  .build()
            ],
          ),
        ],
      ),
    );
  }
}
