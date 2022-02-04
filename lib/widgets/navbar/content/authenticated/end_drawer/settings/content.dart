import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';

import 'business_details_section.dart';
import 'item_collection/item_collection_section.dart';
import 'item_extra_section.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.grey_2,
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: const [
            BusinessDetailsSection(),
            SizedBox(
              height: 20,
            ),
            ItemCollectionSection(),
            SizedBox(
              height: 20,
            ),
            ItemExtraEditSection(),
          ],
        ),
      ),
    );
  }
}
