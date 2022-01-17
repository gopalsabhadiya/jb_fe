import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/item_form_content.dart';

class ItemForm extends StatelessWidget {
  final ItemPresentation _item;
  const ItemForm({Key? key, required item})
      : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 1000),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ItemFormContent(
          item: _item,
        ),
      ),
    );
  }
}
