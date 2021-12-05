import 'package:flutter/cupertino.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/card/header.dart';

import 'content.dart';
import 'footer.dart';

class PaymentCard extends StatelessWidget {
  final Function(String) _onPaymentEdit;
  final String _paymentId;
  const PaymentCard({Key? key, required onPaymentEdit, required paymentId})
      : _onPaymentEdit = onPaymentEdit,
        _paymentId = paymentId,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 350, maxWidth: 250, maxHeight: 350),
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
          const PaymentCardHeader(),
          const PaymentCardContent(),
          PaymentCardFooter(
            onPaymentView: _onPaymentViewClick,
            onPaymentEdit: _onPaymentEditClick,
            onPaymentDelete: _onPaymentDeleteClick,
          ),
        ],
      ),
    );
  }

  _onPaymentViewClick() {
    print("Payment View: $_paymentId");
  }

  _onPaymentEditClick() {
    _onPaymentEdit(_paymentId);
  }

  _onPaymentDeleteClick() {
    print("Party Deleted: $_paymentId");
  }
}
