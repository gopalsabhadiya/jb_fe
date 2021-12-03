import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/card/content.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/card/header.dart';

import 'footer.dart';

class OrderCard extends StatelessWidget {
  final Function(String) _onOrderEdit;
  final String _orderId;
  const OrderCard({Key? key, required onOrderEdit, required orderId})
      : _onOrderEdit = onOrderEdit,
        _orderId = orderId,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 300, maxWidth: 250, maxHeight: 300),
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
          const OrderCardHeader(),
          const OrderCardContent(),
          OrderCardFooter(
            onOrderView: _onOrderViewClick,
            onOrderEdit: _onOrderEditClick,
            onOrderDelete: _onOrderDeleteClick,
          ),
        ],
      ),
    );
  }

  _onOrderViewClick() {
    print("Party favourite: $_orderId");
  }

  _onOrderEditClick() {
    _onOrderEdit(_orderId);
  }

  _onOrderDeleteClick() {
    print("Party Deleted: $_orderId");
  }
}
