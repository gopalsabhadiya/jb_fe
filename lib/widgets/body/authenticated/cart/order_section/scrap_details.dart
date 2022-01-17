import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class ScrapDetails extends StatelessWidget {
  const ScrapDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              AppTextBuilder("Scrap Details:")
                  .color(AppColors.blue_5)
                  .weight(AppFontWeight.BOLD)
                  .build(),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.category,
                  hint: ItemText.CATEGORY_INPUT_TEXT,
                  onChanged: (String value) => print("Dumbo"),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.category,
                  hint: ItemText.CATEGORY_INPUT_TEXT,
                  onChanged: (String value) => print("Dumbo"),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppTextInput(
                  prefixIcon: Icons.category,
                  hint: ItemText.CATEGORY_INPUT_TEXT,
                  onChanged: (String value) => print("Dumbo"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
