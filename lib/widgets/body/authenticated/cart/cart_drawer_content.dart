import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/item_section/order_item_section.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/party_section/party_selection.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class CartDrawerContent extends StatelessWidget {
  final VoidCallback _closeDrawer;
  final List<ItemPresentation> _cartItems;

  const CartDrawerContent({Key? key, required closeDrawer, required cartItems})
      : _closeDrawer = closeDrawer,
        _cartItems = cartItems,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SaveCancelBar(
            cancelCallback: _closeDrawer,
            saveCallback: _saveCallback,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const PartySelectionForOrder(),
                const SizedBox(
                  height: 20,
                ),
                OrderItemSection(
                  closeDrawer: _closeDrawer,
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  _saveCallback() {
    print("Save button clicked");
    _closeDrawer();
  }
}
