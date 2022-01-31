import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button.dart';

class PaymentCardFooter extends StatelessWidget {
  final ReceiptDetailsPresentation _receipt;
  final VoidCallback _onPaymentView;
  // final VoidCallback _onPaymentEdit;
  final VoidCallback _onPaymentDelete;

  const PaymentCardFooter({
    Key? key,
    required ReceiptDetailsPresentation receipt,
    required onPaymentView,
    // required onPaymentEdit,
    required onPaymentDelete,
  })  : _receipt = receipt,
        _onPaymentView = onPaymentView,
        // _onPaymentEdit = onPaymentEdit,
        _onPaymentDelete = onPaymentDelete,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 250, minHeight: 50, maxWidth: 250, maxHeight: 50),
      decoration: const BoxDecoration(
        color: AppColors.grey_2,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppTextBuilder("Active: ")
                    .color(AppColors.blue_5)
                    .size(16)
                    .build(),
                AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                        DefaultTexts.SPACE +
                        _receipt.activeAmmount.toString())
                    .weight(FontWeight.bold)
                    .color(AppColors.green_1)
                    .size(16)
                    .build(),
              ],
            ),
            Row(
              children: [
                AppIconButtonBuilder(Icons.visibility)
                    .size(25)
                    .onClickHandler(_onPaymentView)
                    .padding(EdgeInsets.all(3))
                    .color(AppColors.green_1)
                    .build(),
                // AppIconButtonBuilder(Icons.edit)
                //     .size(25)
                //     .onClickHandler(_onPaymentEdit)
                //     .padding(EdgeInsets.all(3))
                //     .color(AppColors.blue_5)
                //     .build(),
                AppIconButtonBuilder(Icons.delete)
                    .size(25)
                    .onClickHandler(_onPaymentDelete)
                    .padding(EdgeInsets.all(3))
                    .color(AppColors.red_2)
                    .build(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
