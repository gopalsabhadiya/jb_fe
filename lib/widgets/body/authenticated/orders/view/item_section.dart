import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';

import 'order_item.dart';

class OrderFormItemSection extends StatelessWidget {
  final OrderPresentation _order;
  const OrderFormItemSection({Key? key, required OrderPresentation order})
      : _order = order,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }

  List<Widget> _getItems() {
    return _order.items
        .map(
          (item) => OrderFormItemDetails(
            item: item,
          ),
        )
        .toList();
  }
}
