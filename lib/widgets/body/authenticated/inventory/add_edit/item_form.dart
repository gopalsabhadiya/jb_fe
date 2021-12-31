import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/mid/mid_section.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/section/top/top_section.dart';

import 'section/extras/extras_section.dart';

class ItemForm extends StatelessWidget {
  final ItemPresentation _item;
  const ItemForm({Key? key, required item})
      : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 1000),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ItemInputTopSection(item: _item),
              const SizedBox(
                height: 30,
              ),
              ItemInputMidSection(item: _item),
              const SizedBox(
                height: 30,
              ),
              ItemInputExtrasSection(item: _item)
            ],
          )),
    );
  }
}
