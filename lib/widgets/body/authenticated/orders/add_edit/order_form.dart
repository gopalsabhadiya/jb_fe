import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/add_edit/party_section/party_selection.dart';

import 'order_section/order_section.dart';

class OrderForm extends StatelessWidget {
  final OrderPresentation _order;
  final VoidCallback _closeDrawer;
  const OrderForm({Key? key, required closeDrawer, required order})
      : _order = order,
        _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PartySelectionForOrder(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: OrderSectionForCart(
            closeDrawer: _closeDrawer,
          ),
        ),
      ],
    );
  }
}
