import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/enum/features_enum.dart';
import 'package:jb_fe/constants/texts/features_text.dart';
import 'package:jb_fe/util/decorations.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/svg/icons/accounting.dart';
import 'package:jb_fe/widgets/svg/icons/catalog.dart';
import 'package:jb_fe/widgets/svg/icons/device.dart';
import 'package:jb_fe/widgets/svg/icons/diamond.dart';
import 'package:jb_fe/widgets/svg/icons/inventory.dart';
import 'package:jb_fe/widgets/svg/icons/ui.dart';

class FeatureCard extends StatelessWidget {
  final FeaturesEnum featureType;

  const FeatureCard({Key? key, required this.featureType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getIcon(),
              AppTextBuilder(_getHeader())
                  .size(28)
                  .paddingSpecific(top: 20)
                  .build(),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 200,
                child: AppTextBuilder(_getSubHeader())
                    .size(16)
                    .opacity(0.75)
                    .build(),
              )
            ],
          ),
        ),
      ),
      decoration: AppDecorations.withOffset(),
    );
  }

  String _getHeader() {
    switch (featureType) {
      case FeaturesEnum.ONLINE_CATALOG:
        return FeaturesText.ONLINE_CATALOG_H;
      case FeaturesEnum.ACCOUNTING:
        return FeaturesText.ACCOUNTINTING_H;
      case FeaturesEnum.INVENTORY:
        return FeaturesText.INVENTORY_H;
      case FeaturesEnum.LATEST_UI:
        return FeaturesText.LATEST_UI_H;
      case FeaturesEnum.ALL_DEVICES:
        return FeaturesText.ALL_DEVICES_H;
      case FeaturesEnum.SPECIALISED:
        return FeaturesText.SPECIALISED_H;
    }
  }

  String _getSubHeader() {
    switch (featureType) {
      case FeaturesEnum.ONLINE_CATALOG:
        return FeaturesText.ONLINE_CATALOG_SH;
      case FeaturesEnum.ACCOUNTING:
        return FeaturesText.ACCOUNTINTING_SH;
      case FeaturesEnum.INVENTORY:
        return FeaturesText.INVENTORY_SH;
      case FeaturesEnum.LATEST_UI:
        return FeaturesText.LATEST_UI_SH;
      case FeaturesEnum.ALL_DEVICES:
        return FeaturesText.ALL_DEVICES_SH;
      case FeaturesEnum.SPECIALISED:
        return FeaturesText.SPECIALISED_SH;
    }
  }

  Widget _getIcon() {
    switch (featureType) {
      case FeaturesEnum.ONLINE_CATALOG:
        return const IconCatalog();
      case FeaturesEnum.ACCOUNTING:
        return const IconAccounting();
      case FeaturesEnum.INVENTORY:
        return const IconInventory();
      case FeaturesEnum.LATEST_UI:
        return const IconUI();
      case FeaturesEnum.ALL_DEVICES:
        return const IconDevice();
      case FeaturesEnum.SPECIALISED:
        return const IconDiamond();
    }
  }
}
