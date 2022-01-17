import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/order_section/order_section.dart';
import 'package:jb_fe/widgets/body/authenticated/cart/party_section/party_selection.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class CartDrawerContent extends StatelessWidget {
  final VoidCallback _closeDrawer;

  const CartDrawerContent({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SaveCancelBar(
            cancelCallback: _closeDrawer,
            saveCallback: _saveCallback,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const PartySelectionForOrder(),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: OrderSectionForCart(
                      closeDrawer: _closeDrawer,
                    ),
                  )
                ],
              ),
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
