import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/enum/pricing_enum.dart';
import 'package:jb_fe/util/screen_size.dart';

import 'card/pricing_card.dart';

class AppPricing extends StatelessWidget {
  const AppPricing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(ScreenSizeUtil.getContentPadding(context)),
        child: Column(
          children: [
            Container(),
            Wrap(
              clipBehavior: Clip.hardEdge,
              spacing: ScreenSizeUtil.getWidthWidthAddition(context, 50),
              runSpacing: ScreenSizeUtil.getWidthWidthAddition(context, 50),
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: const [
                PricingCard(pricingType: PricingTypeEum.FREE),
                PricingCard(pricingType: PricingTypeEum.PAID),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
