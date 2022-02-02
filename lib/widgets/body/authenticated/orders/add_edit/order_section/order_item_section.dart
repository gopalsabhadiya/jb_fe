import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';

import 'item_in_cart.dart';

class OrderItemSection extends StatelessWidget {
  final OrderPresentation _order;
  const OrderItemSection({Key? key, required order})
      : _order = order,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.blue5WithOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: _getItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _getItems() {
    return _order.items
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ItemInCart(item: e),
          ),
        )
        .toList();
  }
}
