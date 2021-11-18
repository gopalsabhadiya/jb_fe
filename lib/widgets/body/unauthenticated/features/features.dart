import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/enum/features_enum.dart';
import 'package:jb_fe/util/screen_size.dart';

import 'card/feature_card.dart';

class AppFeatures extends StatelessWidget {
  const AppFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue_1,
      child: Padding(
        padding: EdgeInsets.all(ScreenSizeUtil.getContentPadding(context)),
        child: Column(
          children: [
            Container(),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenSizeUtil.getSidePadding(context, 1200),
                  right: ScreenSizeUtil.getSidePadding(context, 1200)),
              child: Wrap(
                clipBehavior: Clip.hardEdge,
                spacing: ScreenSizeUtil.getWidthWidthAddition(context, 50),
                runSpacing: ScreenSizeUtil.getWidthWidthAddition(context, 50),
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: const [
                  FeatureCard(featureType: FeaturesEnum.ONLINE_CATALOG),
                  FeatureCard(featureType: FeaturesEnum.ACCOUNTING),
                  FeatureCard(featureType: FeaturesEnum.INVENTORY),
                  FeatureCard(featureType: FeaturesEnum.LATEST_UI),
                  FeatureCard(featureType: FeaturesEnum.ALL_DEVICES),
                  FeatureCard(featureType: FeaturesEnum.SPECIALISED)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
