import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/inventory/add_item/add_item_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/add_edit/item_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class AddItem extends StatefulWidget {
  final VoidCallback _closeDrawer;
  final ItemPresentation _item;

  const AddItem({
    Key? key,
    required VoidCallback closeDrawer,
    required ItemPresentation item,
  })  : _item = item,
        _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SaveCancelBar(
            cancelCallback: _cancelSave,
            saveCallback: _updateItem,
          ),
          BlocConsumer<AddItemBloc, AddItemState>(
            listener: (BuildContext context, AddItemState state) {
              if (state.status == AddItemStatus.COMPLETED) {
                widget._closeDrawer();
              }
            },
            builder: (BuildContext context, AddItemState state) {
              switch (state.status) {
                case AddItemStatus.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AddItemStatus.COMPLETED:
                  return Form(
                    key: _formKey,
                    child: ItemForm(
                      item: widget._item,
                    ),
                  );
                case AddItemStatus.ERROR:
                  return AppTextBuilder("Opps Something went wrong").build();
              }
            },
          ),
          Container()
        ],
      ),
    );
  }

  void _updateItem() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AddItemBloc>(context).add(
        AddNewItem(
          item: widget._item,
        ),
      );
    }
  }

  void _cancelSave() {
    widget._closeDrawer();
  }
}
