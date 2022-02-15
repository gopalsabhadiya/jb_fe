import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';
import 'package:jb_fe/widgets/common/chip.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class ItemCollectionSectionType extends StatefulWidget {
  final String _category;
  final List<String> _types;
  const ItemCollectionSectionType(
      {Key? key, required String category, required List<String> types})
      : _category = category,
        _types = types,
        super(key: key);

  @override
  State<ItemCollectionSectionType> createState() =>
      _ItemCollectionSectionTypeState();
}

class _ItemCollectionSectionTypeState extends State<ItemCollectionSectionType> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.grey_1,
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.grey_2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextBuilder(widget._category)
                      .color(AppColors.blue_5)
                      .weight(AppFontWeight.BOLD)
                      .paddingAll(10)
                      .size(16)
                      .build(),
                  IconButton(
                    onPressed: () => _removeExtraFromCollection(context),
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.red_2,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            IntrinsicHeight(
              child: Container(
                constraints: const BoxConstraints(minHeight: 104),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          AppTextInput(
                            prefixIcon: Icons.category,
                            hint: ItemText.ADD_TYPE_INPUT_TEXT,
                            onChanged: _collectionTypeChanged,
                            controller: textEditingController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppButton(
                            icon: Icons.add_circle,
                            hint: ItemText.ADD_EXTRA_INPUT_TEXT,
                            onClick: _addTypeToCollection,
                            colorScheme: ButtonColorScheme.BLUE,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 2,
                      color: AppColors.blue_5,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: _getTypes(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getTypes() {
    return widget._types
        .map(
          (type) => AppChip(
            text: widget._category + " - " + type,
            onDeleted: () => _deleteType(type),
          ),
        )
        .toList();
  }

  void _addTypeToCollection() {
    print('Add this categody to collection: ${textEditingController.text}');
    if (!widget._types.contains(textEditingController.text) &&
        textEditingController.text.isNotEmpty) {
      widget._types.add(textEditingController.text);
      print(widget._types);
    }
    setState(() {});
  }

  _removeExtraFromCollection(BuildContext context) {
    print("Remove this extra");
  }

  _deleteType(String type) {
    print("Delete: ${type}");
    widget._types.remove(type);
    print("Deleted: ${widget._types}");
    setState(() {});
  }

  _collectionTypeChanged(String value) {
    print("Type changed: value");
  }
}
