import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/card/header.dart';

import 'content.dart';
import 'footer.dart';

class PaymentCard extends StatelessWidget {
  final ReceiptDetailsPresentation _receipt;
  final VoidCallback _onViewReceipt;
  const PaymentCard(
      {Key? key,
      required ReceiptDetailsPresentation receipt,
      required VoidCallback onViewReceipt})
      : _receipt = receipt,
        _onViewReceipt = onViewReceipt,
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
          PaymentCardHeader(
            receipt: _receipt,
          ),
          PaymentCardContent(
            receipt: _receipt,
          ),
          PaymentCardFooter(
            receipt: _receipt,
            onPaymentView: _onViewReceipt,
            // onPaymentEdit: _onPaymentEditClick,
            onPaymentDelete: _onPaymentDeleteClick,
          ),
        ],
      ),
    );
  }

  _onPaymentDeleteClick() {
    print("Party Deleted: $_receipt");
  }
}
