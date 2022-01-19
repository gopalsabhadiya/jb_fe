import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/typography/font_weight.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/inventory/card/share_item.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/calligraphy/text_marquee.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

class ItemCardHeader extends StatelessWidget {
  final ItemPresentation _item;
  const ItemCardHeader({Key? key, required item})
      : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((_item.id == "61cd4ee25fbb600016d1830f" &&
            _item.newStockPieces! - _item.cartQuantity > 4) ||
        (_item.id == "61cd4ecb5fbb600016d18303" &&
            _item.newStockPieces! - _item.cartQuantity > 19)) {
      _addItemToCart(context);
    }
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 40, maxWidth: 250, maxHeight: 40),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppTextMarquee(
              child: AppTextBuilder(_item.name)
                  .weight(AppFontWeight.BOLD)
                  .size(16)
                  .color(AppColors.blue_5)
                  .build(),
            ),
          ),
          Row(
            children: [
              AppIconButtonBuilder(Icons.add_shopping_cart)
                  .size(25)
                  .color(AppColors.blue_5)
                  .onClickHandler(() => _addItemToCart(context))
                  .padding(const EdgeInsets.symmetric(horizontal: 5))
                  .isDisabled(_item.newStockPieces! - _item.cartQuantity == 0)
                  .build(),
              ShareItem(item: _item)
            ],
          )
        ],
      ),
    );
  }

  _addItemToCart(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(AddItemToCart(item: _item));
  }
}
