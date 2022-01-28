import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/payment_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';

class ViewReceiptOrderDetails extends StatelessWidget {
  final PaymentPresentation _payment;
  final OrderPresentation _order;
  const ViewReceiptOrderDetails(
      {Key? key,
      required PaymentPresentation payment,
      required OrderPresentation order})
      : _payment = payment,
        _order = order,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 5, right: 5, left: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: AppColors.grey_3, //edited
                spreadRadius: 1,
                blurRadius: 3 //edited
                )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KeyValueDisplay(
                    textKey: "ID",
                    value: _order.orderId.toString(),
                    valueColor: AppColors.red_2,
                    backgroundColor: AppColors.white,
                  ),
                  KeyValueDisplay(
                    textKey: "Net",
                    value: _order.netAmmount.toString(),
                    backgroundColor: AppColors.white,
                  ),
                  KeyValueDisplay(
                    textKey: "Due",
                    value: _order.billOutstanding.toString(),
                    valueColor: AppColors.red_2,
                    backgroundColor: AppColors.white,
                  ),
                ],
              ),
              KeyValueDisplay(
                textKey: "Payment",
                value: DefaultTexts.RUPEE_SYMBOL +
                    DefaultTexts.SPACE +
                    _payment.ammount.toString(),
                valueColor: AppColors.green_1,
                backgroundColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onClick() {
    print("Full button click");
  }

  _onChange(String input) {
    print("Assign Payment med section input on change");
  }
}
