import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/util/date_util.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';

class ViewReceiptMidSection extends StatelessWidget {
  final ReceiptPresentation _receipt;
  const ViewReceiptMidSection({
    Key? key,
    required ReceiptPresentation receipt,
  })  : _receipt = receipt,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeyValueDisplay(
                value: DefaultTexts.RUPEE_SYMBOL +
                    DefaultTexts.SPACE +
                    _receipt.ammount.toString(),
                iconKey: Icons.sell,
                backgroundColor: AppColors.white,
              ),
              AppTextBuilder(DefaultTexts.RUPEE_SYMBOL +
                      DefaultTexts.SPACE +
                      _receipt.activeAmmount.toString())
                  .weight(FontWeight.bold)
                  .size(25)
                  .color(AppColors.blue_5)
                  .build(),
              KeyValueDisplay(
                value: DateUtil.dateToString(_receipt.date),
                backgroundColor: AppColors.white,
                iconKey: Icons.event,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeyValueDisplay(
                value: _receipt.paymentMode,
                textKey: "Payment Type",
                backgroundColor: AppColors.white,
              ),
              KeyValueDisplay(
                value: _receipt.pan ?? DefaultTexts.NULL_STRING,
                backgroundColor: AppColors.white,
                textKey: "PAN",
                valueColor:
                    _receipt.pan != null ? AppColors.blue_5 : AppColors.red_2,
              ),
              KeyValueDisplay(
                value: _receipt.aadhar ?? DefaultTexts.NULL_STRING,
                backgroundColor: AppColors.white,
                textKey: "Aadhar",
                valueColor: _receipt.aadhar != null
                    ? AppColors.blue_5
                    : AppColors.red_2,
              ),
              KeyValueDisplay(
                value: _receipt.check ?? DefaultTexts.NULL_STRING,
                backgroundColor: AppColors.white,
                textKey: "Check",
                valueColor:
                    _receipt.check != null ? AppColors.blue_5 : AppColors.red_2,
              ),
              KeyValueDisplay(
                value: _receipt.bank ?? DefaultTexts.NULL_STRING,
                backgroundColor: AppColors.white,
                textKey: "Bank",
                valueColor:
                    _receipt.bank != null ? AppColors.blue_5 : AppColors.red_2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
