import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';

class ReceiptFormMidSection extends StatelessWidget {
  final ReceiptPresentation _receipt;
  const ReceiptFormMidSection({Key? key, required ReceiptPresentation receipt})
      : _receipt = receipt,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextInput(
                    prefixIcon: Icons.credit_card,
                    hint: PaymentText.PAYMENT_TYPE_INPUT_TEXT,
                    onChanged: _onChange),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                    prefixIcon: Icons.sell,
                    hint: PaymentText.AMMOUNT_INPUT_TEXT,
                    onChanged: _onChange),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                    prefixIcon: Icons.pin,
                    hint: PaymentText.CHECK_NUMBER_INPUT_TEXT,
                    onChanged: _onChange),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextInput(
                    prefixIcon: Icons.badge,
                    hint: PaymentText.PAN_INPUT_TEXT,
                    onChanged: _onChange),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                    prefixIcon: Icons.badge,
                    hint: PaymentText.AADHAR_INPUT_TEXT,
                    onChanged: _onChange),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                    prefixIcon: Icons.account_balance,
                    hint: PaymentText.BANK_NAME_INPUT_TEXT,
                    onChanged: _onChange),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onChange(String input) {
    print("Assign Payment med section input on change");
  }
}
