import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/order_section/order_left_panel.dart';

import 'order_payment.dart';

class PaymentFormOrderSection extends StatelessWidget {
  final List<OrderPresentation> _unpaidOrderList;
  const PaymentFormOrderSection({
    Key? key,
    required List<OrderPresentation> unpaidOrderList,
  })  : _unpaidOrderList = unpaidOrderList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
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
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ReceiptOrderLeftSection(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.blue_1,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5), bottom: Radius.circular(5)),
                  ),
                  child: ListView(
                    children: _getOrders(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getOrders() {
    return _unpaidOrderList
        .map(
          (order) => PaymentFormOrderDetails(
            order: order,
          ),
        )
        .toList();
  }
}
