import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/inventory/update_item/update_item_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

import 'item_form.dart';

class EditItem extends StatefulWidget {
  final VoidCallback _closeDrawer;
  final ItemPresentation _item;

  const EditItem({
    Key? key,
    required ItemPresentation item,
    required closeDrawer,
  })  : _item = item,
        _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: AppColors.blue_5,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconButtonBuilder(Icons.arrow_back)
                      .size(25)
                      .onClickHandler(_cancelSave)
                      .color(AppColors.grey_1)
                      .build(),
                  InkWell(
                    onTap: _updateItem,
                    child: AppTextBuilder("Save")
                        .size(20)
                        .weight(AppFontWeight.BOLD)
                        .color(AppColors.grey_1)
                        .paddingHorizontal(20)
                        .build(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ItemForm(
              item: widget._item,
            ),
          ),
        ],
      ),
    );
  }

  void _updateItem() {
    if (_formKey.currentState!.validate()) {
      print("Updating party");
      BlocProvider.of<UpdateItemBloc>(context).add(UpdateItem(
        item: widget._item,
      ));
    }
  }

  void _cancelSave() {
    print("Cancel Save Item");
    widget._closeDrawer();
  }
}
