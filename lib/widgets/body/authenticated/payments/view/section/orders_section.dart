import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/payment_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/view/section/order_payment.dart';

class ViewReceiptOrderSection extends StatelessWidget {
  final ReceiptPresentation _receipt;
  final List<OrderPresentation> _orders;
  const ViewReceiptOrderSection({
    Key? key,
    required ReceiptPresentation receipt,
    required List<OrderPresentation> orders,
  })  : _receipt = receipt,
        _orders = orders,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.blue_1,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5), bottom: Radius.circular(5)),
                  ),
                  child: ListView(
                    // children: [
                    //   ViewReceiptOrderDetails(),
                    // ],
                    children: _getOrderDetails(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getOrderDetails() {
    List<Widget> orderDetailsWidgetList = <Widget>[];
    for (final PaymentPresentation payment in _receipt.payments) {
      final order = _orders.where((order) => order.id == payment.orderId).first;
      print("Orderd----------------------------------------------: ${order.id}");
      orderDetailsWidgetList.add(
        ViewReceiptOrderDetails(
          payment: payment,
          order: order,
        ),
      );
    }
    return orderDetailsWidgetList;
  }
}
