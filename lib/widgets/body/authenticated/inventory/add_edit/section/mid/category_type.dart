import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/widgets/common/inputs/dropdown_button.dart';

class CategoryTypeSelector extends StatefulWidget {
  final Map<String, List<String>> _itemCollection;
  final ItemPresentation _item;
  const CategoryTypeSelector({
    Key? key,
    Map<String, List<String>> itemCollection = const {
      "No Data Found": ["No Data Found"]
    },
    required ItemPresentation item,
  })  : _itemCollection = itemCollection,
        _item = item,
        super(key: key);

  @override
  State<CategoryTypeSelector> createState() => _CategoryTypeSelectorState();
}

class _CategoryTypeSelectorState extends State<CategoryTypeSelector> {
  late String _category;
  late String _type;

  @override
  void initState() {
    _category = widget._item.newCategory;
    _type = widget._item.newType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Building category type");
    return Row(
      children: [
        Expanded(
          child: AppDropDownButton(
            initialValue: _category,
            items: widget._itemCollection.keys.toList(),
            prefixIcon: Icons.category,
            onSetValue: _setCategory,
            hint: ItemText.CATEGORY_INPUT_TEXT,
            validator: widget._item.newCategoryValidator,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: AppDropDownButton(
            initialValue: _type,
            items: widget._itemCollection[_category]!,
            prefixIcon: Icons.category,
            onSetValue: _setType,
            hint: ItemText.TYPE_INPUT_TEXT,
            validator: widget._item.newTypeValidator,
          ),
        ),
      ],
    );
  }

  String? categoryValidator(String? value) {
    if (value != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  String? typeValidator(String? value) {
    if (value != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }

  void _setCategory(String? category) {
    print("Setting category");
    if (category != null) {
      print("Setting state category");
      setState(() {
        _category = category;
        _type = widget._itemCollection[category]!.first;
      });
      print("Set state category complete");
      widget._item.setNewCategory(_category);
      widget._item.setNewType(_type);
      print("Setting new type and category");
    }
  }

  void _setType(String? type) {
    print("Setting type");
    if (type != null) {
      widget._item.setNewType(type);
      setState(() {
        _type = type;
      });
    }
  }
}
