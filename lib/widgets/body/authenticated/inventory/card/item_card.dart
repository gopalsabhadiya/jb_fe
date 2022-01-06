import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/controllers/bloc/inventory/delete_item/delete_item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_image/item_image_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/footer.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/header.dart';
import 'package:jb_fe/widgets/common/alerts/confirmation_alert.dart';

import 'content.dart';

class ItemCard extends StatelessWidget {
  final Function(ItemPresentation) _onItemEdit;
  final ItemPresentation _item;

  const ItemCard({Key? key, required onItemEdit, required item})
      : _onItemEdit = onItemEdit,
        _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 340, maxWidth: 250, maxHeight: 340),
      decoration: BoxDecoration(
        color: AppColors.blue_1,
        borderRadius: BorderRadius.circular(5),
        // boxShadow: const [
        //   BoxShadow(
        //       offset: Offset(2, 2),
        //       color: AppColors.grey_3, //edited
        //       spreadRadius: 1,
        //       blurRadius: 5 //edited
        //       )
        // ],
      ),
      child: BlocProvider<ItemImageBloc>(
        lazy: false,
        create: (BuildContext context) => serviceLocator<ItemImageBloc>()
          ..add(
            FetchImages(item: _item),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemCardHeader(
              item: _item,
            ),
            InventoryCardContent(
              item: _item,
            ),
            ItemCardFooter(
              onItemView: _onItemViewClick,
              onItemEdit: _onItemEditClick,
              onItemDelete: () => _onItemDeleteClick(context),
              item: _item,
            ),
          ],
        ),
      ),
    );
  }

  _onItemViewClick() {
    print("Item View: $_item");
  }

  _onItemEditClick() {
    _onItemEdit(_item);
  }

  _onItemDeleteClick(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return ConfirmationAlert(
            title: ItemText.DELETE_ITEM_ALERT_HEADER,
            content: ItemText.DELETE_ITEM_ALERT_MESSAGE,
            variable: _item.name +
                DefaultTexts.SPACE +
                (_item.huid ?? DefaultTexts.EMPTY),
            continueCallBack: () {
              Navigator.of(context).pop();
              _deleteItem(parentContext);
            });
      },
    );
  }

  _deleteItem(BuildContext context) {
    BlocProvider.of<DeleteItemBloc>(context)
        .add(DeleteItem(itemIdToBeDeleted: _item.id!));
  }
}
