import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/footer.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/header.dart';

import 'content.dart';

class ItemCard extends StatelessWidget {
  final Function(String) _onItemEdit;
  final String _itemId;
  const ItemCard({Key? key, required onItemEdit, required itemId})
      : _onItemEdit = onItemEdit,
        _itemId = itemId,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 350, maxWidth: 250, maxHeight: 350),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 5 //edited
                )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemCardHeader(),
          InventoryCardContent(),
          ItemCardFooter(
            onItemView: _onItemViewClick,
            onItemEdit: _onItemEditClick,
            onItemDelete: _onItemDeleteClick,
          ),
        ],
      ),
    );
  }

  _onItemViewClick() {
    print("Item View: $_itemId");
  }

  _onItemEditClick() {
    _onItemEdit(_itemId);
  }

  _onItemDeleteClick() {
    print("Item Deleted: $_itemId");
  }
}
