import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/enum/pricing_enum.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/util/pricing.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/capsule_pair.dart';

class PricingCard extends StatelessWidget {
  final PricingTypeEum pricingType;

  const PricingCard({Key? key, required this.pricingType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.grey_3, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CapsulePair(
                    bigCapsuleText:
                        PricingUtil.getBigCapsuleText(pricingType: pricingType),
                    smallCapsuleText: PricingUtil.getSmallCapsuleText(
                        pricingType: pricingType)),
                AppTextBuilder(PricingUtil.getHeader(pricingType: pricingType))
                    .size(20)
                    .paddingVertical(40)
                    .build(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _getFeatures(),
            ),
            Container(
              height: 3,
              width: 250,
              color: AppColors.blue_2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextBuilder(
                          PricingUtil.getPriceFor(pricingType: pricingType))
                      .size(35)
                      .weight(AppFontWeight.BOLD)
                      .color(AppColors.blue_5)
                      .build(),
                  AppTextBuilder(
                          PricingUtil.getDaysFor(pricingType: pricingType))
                      .size(20)
                      .color(AppColors.blue_5)
                      .build(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getFeatures() {
    List<Widget> features = [];
    PricingUtil.getFeaturesFor(pricingType: pricingType)
        .forEach((feature, supported) => {
              features.addAll([
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      supported ? Icons.check_circle : Icons.cancel_outlined,
                      color: AppColors.blue_5,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppTextBuilder(feature).opacity(0.75).build()
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ])
            });
    return features;
  }
}
