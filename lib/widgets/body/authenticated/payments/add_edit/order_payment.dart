import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';

class PaymentFormOrderDetails extends StatelessWidget {
  const PaymentFormOrderDetails({Key? key}) : super(key: key);

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
              const KeyValueDisplay(
                textKey: "ID",
                value: "15",
                valueColor: AppColors.red_2,
                backgroundColor: AppColors.white,
              ),
              const KeyValueDisplay(
                textKey: "Net",
                value: "₹ 25,000",
                backgroundColor: AppColors.white,
              ),
              const KeyValueDisplay(
                textKey: "Paid",
                value: "₹ 5,000",
                valueColor: AppColors.green_1,
                backgroundColor: AppColors.white,
              ),
              const KeyValueDisplay(
                textKey: "Due",
                value: "₹ 50,000",
                valueColor: AppColors.red_2,
                backgroundColor: AppColors.white,
              ),
              SizedBox(
                width: 250,
                child: AppTextInput(
                    prefixIcon: Icons.sell,
                    hint: PaymentText.ORDER_DEPOSIT_INPUT_TEXT,
                    onChanged: _onChange),
              ),
              AppButton(
                  hint: "Full",
                  onClick: _onClick,
                  colorScheme: ButtonColorScheme.BLUE)
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
