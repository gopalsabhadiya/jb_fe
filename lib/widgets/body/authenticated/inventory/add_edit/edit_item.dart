import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/inventory/update_item/update_item_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SaveCancelBar(
            cancelCallback: _cancelSave,
            saveCallback: _updateItem,
          ),
          BlocConsumer<UpdateItemBloc, UpdateItemState>(
            listener: (BuildContext context, UpdateItemState state) {
              if (state.status == UpdateItemStatus.COMPLETED) {
                widget._closeDrawer();
              }
            },
            builder: (BuildContext context, UpdateItemState state) {
              switch (state.status) {
                case UpdateItemStatus.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case UpdateItemStatus.COMPLETED:
                  return Expanded(
                    child: Form(
                      key: _formKey,
                      child: ItemForm(
                        item: widget._item,
                      ),
                    ),
                  );
                case UpdateItemStatus.ERROR:
                  return AppTextBuilder("Opps Something went wrong").build();
              }
            },
          ),
          Container(),
        ],
      ),
    );
  }

  void _updateItem() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<UpdateItemBloc>(context).add(UpdateItem(
        item: widget._item,
      ));
    }
  }

  void _cancelSave() {
    widget._closeDrawer();
  }
}
