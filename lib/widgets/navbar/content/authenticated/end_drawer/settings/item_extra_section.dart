import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';
import 'package:jb_fe/widgets/common/chip.dart';
import 'package:jb_fe/widgets/common/inputs/checkbox.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/svg/icons/app_icons.dart';

class ItemExtraEditSection extends StatefulWidget {
  final BusinessPresentation _business;
  const ItemExtraEditSection({Key? key, required BusinessPresentation business})
      : _business = business,
        super(key: key);

  @override
  State<ItemExtraEditSection> createState() => _ItemExtraEditSectionState();
}

class _ItemExtraEditSectionState extends State<ItemExtraEditSection> {
  bool quantitative = true;

  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              AppTextBuilder("Item Extras:")
                  .color(AppColors.blue_5)
                  .size(20)
                  .weight(AppFontWeight.BOLD)
                  .build(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.grey_3,
                  height: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 300,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: AppColors.blue_1,
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(5, 5),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextBuilder("Add Extra")
                          .color(AppColors.blue_5)
                          .weight(AppFontWeight.BOLD)
                          .build(),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextInput(
                        initialValue: DefaultTexts.EMPTY,
                        prefixIcon: AppIcons.crystal,
                        hint: ItemText.ADD_EXTRA_TYPE_INPUT_TEXT,
                        onChanged: _extraInputChanged,
                        controller: textEditingController,
                        // validator: _extra.newPiecesValidator,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppCheckbox(
                            hint: "Quantity",
                            onChanged: (bool value) => quantitative = value,
                            initialValue: true,
                            tooltip: ItemText.EXTRA_ITEM_QUANTITATIVE_TOOLTIP,
                          ),
                          AppButton(
                            icon: Icons.add_circle,
                            hint: ItemText.ADD_EXTRA_INPUT_TEXT,
                            onClick: _addExtraToExtras,
                            colorScheme: ButtonColorScheme.BLUE,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: 20,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.blue_5,
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(5, 5),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.grey_1,
                      ),
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: _getExtraItems(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getExtraItems() {
    return widget._business.extras.entries
        .map(
          (entry) => AppChip(
            text: entry.key,
            icon: entry.value ? Icons.check_box : Icons.check_box_outline_blank,
            onDeleted: () => _deleteExtra(entry.key),
          ),
        )
        .toList();
  }

  void _deleteExtra(String extra) {
    print("Remove: $extra");
    widget._business.extras.remove(extra);
    setState(() {});
  }

  _addExtraToExtras() {
    print('Add this extra to collection: ${textEditingController.text}');
    if (!widget._business.extras.containsKey(textEditingController.text) &&
        textEditingController.text.isNotEmpty) {
      widget._business.extras[textEditingController.text] = quantitative;
    }
    setState(() {});
  }

  _extraInputChanged(String value) {
    print("Extra item input changed");
  }
}
