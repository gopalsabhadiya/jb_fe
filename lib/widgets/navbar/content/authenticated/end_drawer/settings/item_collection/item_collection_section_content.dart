import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

import 'item_collection_section_type.dart';

class ItemCollectionSectionContent extends StatefulWidget {
  final Map<String, List<String>> _itemCollection;
  const ItemCollectionSectionContent(
      {Key? key, required Map<String, List<String>> itemCollection})
      : _itemCollection = itemCollection,
        super(key: key);

  @override
  State<ItemCollectionSectionContent> createState() =>
      _ItemCollectionSectionContentState();
}

class _ItemCollectionSectionContentState
    extends State<ItemCollectionSectionContent> {
  late final ScrollController controller;
  late final TextEditingController textEditingController;

  @override
  void initState() {
    controller = ScrollController();
    textEditingController = TextEditingController();
    super.initState();
  }

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
                prefixIcon: Icons.category,
                hint: ItemText.ADD_CATEGORY_INPUT_TEXT,
                onChanged: _collectionCategoryChanged,
                controller: textEditingController,
              ),
              const SizedBox(
                height: 10,
              ),
              AppButton(
                icon: Icons.add_circle,
                hint: ItemText.ADD_EXTRA_INPUT_TEXT,
                onClick: _addCategoryToCollection,
                colorScheme: ButtonColorScheme.BLUE,
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: double.maxFinite,
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

  void _collectionCategoryChanged(String value) {
    print("Category changed");
  }

  void _addCategoryToCollection() {
    print('Add this categody to collection: ${textEditingController.text}');
    if (!widget._itemCollection.containsKey(textEditingController.text) &&
        textEditingController.text.isNotEmpty) {
      widget._itemCollection[textEditingController.text] = [];
      setState(() {});
      print(widget._itemCollection);
    }
  }

  _getExtraItemForm() {
    return widget._itemCollection.entries
        .map(
          (entry) => ItemCollectionSectionType(
            category: entry.key,
            types: entry.value,
          ),
        )
        .toList();
  }
}
