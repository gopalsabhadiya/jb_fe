import 'package:flutter/cupertino.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/view/section/mid_section.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/view/section/orders_section.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/view/section/top_section.dart';

class ReceiptDisplayContent extends StatelessWidget {
  final ReceiptPresentation _receipt;
  final List<OrderPresentation> _orders;
  final PartyPresentation _party;
  const ReceiptDisplayContent({
    Key? key,
    required ReceiptPresentation receipt,
    required List<OrderPresentation> orders,
    required PartyPresentation party,
  })  : _receipt = receipt,
        _orders = orders,
        _party = party,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ViewReceiptTopSection(
                party: _party,
              ),
              ViewReceiptMidSection(
                receipt: _receipt,
              ),
              ViewReceiptOrderSection(
                receipt: _receipt,
                orders: _orders,
              )
              // AppTextBuilder("Hello").build(),
            ],
          ),
        ),
      ),
    );
  }
}
