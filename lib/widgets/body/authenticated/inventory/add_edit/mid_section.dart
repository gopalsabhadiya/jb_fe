import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class ItemInputMedSection extends StatefulWidget {
  const ItemInputMedSection({Key? key}) : super(key: key);

  @override
  State<ItemInputMedSection> createState() => _ItemInputMedSectionState();
}

class _ItemInputMedSectionState extends State<ItemInputMedSection> {
  List<bool> _labour_type_selections =
      List.generate(ItemText.LABOUR_TYPE_LIST.length, (index) => false);

  @override
  void initState() {
    _labour_type_selections[0] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // AppTextBuilder("Hello").build()
            Expanded(
              child: AppTextInput(
                  prefixIcon: Icons.category,
                  hint: ItemText.CATEGORY_INPUT_TEXT,
                  onChanged: _onChange),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                  prefixIcon: Icons.category,
                  hint: ItemText.TYPE_INPUT_TEXT,
                  onChanged: _onChange),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                  prefixIcon: AppIcons.id,
                  hint: ItemText.HUID_IINPUT_TEXT,
                  onChanged: _onChange),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            // AppTextBuilder("Hello").build()
            Expanded(
              child: AppTextInput(
                  prefixIcon: Icons.extension,
                  hint: ItemText.PIECE_INPUT_TEXT,
                  onChanged: _onChange),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                  prefixIcon: AppIcons.gross_weight,
                  hint: ItemText.GW_INPUT_TEXT,
                  onChanged: _onChange),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                  prefixIcon: AppIcons.net_weight,
                  hint: ItemText.NW_INPUT_TEXT,
                  onChanged: _onChange),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            // AppTextBuilder("Hello").build()
            Expanded(
              child: AppTextInput(
                  prefixIcon: AppIcons.karat,
                  hint: ItemText.KARAT_INPUT_TEXT,
                  onChanged: _onChange),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: AppTextInput(
                  prefixIcon: Icons.engineering,
                  hint: ItemText.LABOUR_INPUT_TEXT,
                  onChanged: _onChange),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: ToggleButtons(
                isSelected: _labour_type_selections,
                color: AppColors.blue_5,
                fillColor: AppColors.blue_5,
                borderRadius: BorderRadius.circular(100),
                selectedBorderColor: AppColors.blue_5,
                borderWidth: 2,
                highlightColor: AppColors.blue_1,
                borderColor: AppColors.blue_5,
                splashColor: AppColors.blue_5,
                children: _getLabourTypes(),
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _labour_type_selections.length; i++) {
                      _labour_type_selections[i] = i == index ? true : false;
                    }
                  });
                },
              ),
            )
          ],
        )
      ],
    );
  }

  List<Widget> _getLabourTypes() {
    List<Widget> _items = [];
    for (int i = 0; i < ItemText.LABOUR_TYPE_LIST.length; i++) {
      if (_labour_type_selections[i]) {
        _items.add(AppTextBuilder(ItemText.LABOUR_TYPE_LIST[i])
            .color(AppColors.white)
            .size(16)
            .paddingAll(12)
            .build());
      } else {
        _items.add(AppTextBuilder(ItemText.LABOUR_TYPE_LIST[i])
            .color(AppColors.blue_5)
            .size(16)
            .paddingAll(12)
            .build());
      }
    }
    return _items;
  }

  _onChange(String input) {
    print("Assign Item med section input on change");
  }
}
