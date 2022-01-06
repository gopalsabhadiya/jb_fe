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
  late TextEditingController _typeEditingController;

  @override
  void initState() {
    _typeEditingController = TextEditingController();
    _category = widget._item.newCategory.isNotEmpty
        ? widget._item.newCategory
        : widget._itemCollection.keys.first;
    _type = widget._item.newType.isNotEmpty
        ? widget._item.newType
        : widget._itemCollection[_category]!.first;

    widget._item.setNewCategory(_category);
    widget._item.setNewType(_type);
    super.initState();
  }

  @override
  void dispose() {
    // _typeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            textEditingController: _typeEditingController,
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
    print("SetCategory: $category");
    if (category != null) {
      setState(() {
        _category = category;
        _type = widget._itemCollection[category]!.first;
      });
      _typeEditingController.text = _type;
      widget._item.setNewCategory(_category);
      widget._item.setNewType(_type);
    }
  }

  void _setType(String? type) {
    print("SetType: $type");
    if (type != null) {
      widget._item.setNewType(type);
      setState(() {
        _type = type;
      });
    }
  }
}
