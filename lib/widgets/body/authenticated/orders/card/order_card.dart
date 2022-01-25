import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/order/details/order_details_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/controllers/bloc/order/delete_order/delete_order_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/card/content.dart';
import 'package:jb_fe/widgets/body/authenticated/orders/card/header.dart';
import 'package:jb_fe/widgets/common/alerts/confirmation_alert.dart';

import 'footer.dart';

class OrderCard extends StatelessWidget {
  final VoidCallback _onViewOrder;
  final OrderDetailsPresentation _order;
  const OrderCard(
      {Key? key,
      required OrderDetailsPresentation order,
      required VoidCallback onViewOrder})
      : _order = order,
        _onViewOrder = onViewOrder,
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
          OrderCardHeader(
            order: _order,
          ),
          OrderCardContent(
            order: _order,
          ),
          OrderCardFooter(
            order: _order,
            onOrderView: _onViewOrder,
            onOrderDelete: () => _onOrderDeleteClick(context),
          ),
        ],
      ),
    );
  }

  _onOrderDeleteClick(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return ConfirmationAlert(
            title: OrderText.DELETE_ORDER_ALERT_HEADER,
            content: OrderText.DELETE_ORDER_ALERT_MESSAGE,
            variable: _order.orderId.toString(),
            continueCallBack: () {
              Navigator.of(context).pop();
              _deleteOrder(parentContext);
            });
      },
    );
  }

  _deleteOrder(BuildContext context) {
    BlocProvider.of<DeleteOrderBloc>(context)
        .add(DeleteOrder(orderIdToBeDeleted: _order.id));
  }
}
