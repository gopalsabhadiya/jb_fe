import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class ItemCollectionSectionContent extends StatefulWidget {
  const ItemCollectionSectionContent({Key? key}) : super(key: key);

  @override
  State<ItemCollectionSectionContent> createState() =>
      _ItemCollectionSectionContentState();
}

class _ItemCollectionSectionContentState
    extends State<ItemCollectionSectionContent> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 300,
          decoration: const BoxDecoration(
            color: AppColors.blue_1,
            borderRadius: BorderRadius.all(
              Radius.elliptical(5, 5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextBuilder("Add Category")
                  .color(AppColors.blue_5)
                  .weight(AppFontWeight.BOLD)
                  .build(),
              const SizedBox(
                height: 10,
              ),
              AppTextInput(
                initialValue: DefaultTexts.EMPTY,
                prefixIcon: Icons.extension,
                hint: ItemText.EXTRA_PIECE_INPUT_TEXT,
                onChanged: (String value) => {},
                // validator: _extra.newPiecesValidator,
              ),
              const SizedBox(
                height: 10,
              ),
              AppButton(
                icon: Icons.add_circle,
                hint: ItemText.ADD_EXTRA_INPUT_TEXT,
                onClick: () => {},
                colorScheme: ButtonColorScheme.BLUE,
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.blue_5,
              borderRadius: BorderRadius.all(
                Radius.elliptical(5, 5),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: _getExtraItemForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _getExtraItemForm() {
    final extrasForms = <Widget>[];
    extrasForms.add(const ItemCollectionSectionContent());
    return extrasForms;
  }
}
