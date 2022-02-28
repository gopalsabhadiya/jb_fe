import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/enum/payment_mode_enum.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/controllers/bloc/receipt/unsorted_amount/unsorted_amount_cubit.dart';
import 'package:jb_fe/widgets/common/inputs/dropdown_button.dart';
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
                child: AppDropDownButton(
                  initialValue: _receipt.paymentMode.name(),
                  items: PaymentModeEnum.values.map((e) => e.name()).toList(),
                  prefixIcon: Icons.credit_card,
                  onSetValue: _receipt.setPaymentMode,
                  hint: PaymentText.PAYMENT_TYPE_INPUT_TEXT,
                  validator: _receipt.paymentModeValidator,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  initialValue: _receipt.ammount != 0
                      ? _receipt.ammount.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.sell,
                  hint: PaymentText.AMMOUNT_INPUT_TEXT,
                  onChanged: (String value) =>
                      _onReceiptAmountChange(value, context),
                  validator: _receipt.ammountValidator,
                  isNumberInput: true,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  initialValue: _receipt.check != 0
                      ? _receipt.check.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.pin,
                  hint: PaymentText.CHECK_NUMBER_INPUT_TEXT,
                  onChanged: _receipt.setCheck,
                  validator: _receipt.checkValidator,
                  isNumberInput: true,
                ),
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
                  initialValue: _receipt.pan != null && _receipt.pan!.isNotEmpty
                      ? _receipt.pan.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.badge,
                  hint: PaymentText.PAN_INPUT_TEXT,
                  onChanged: _receipt.setPan,
                  validator: _receipt.panValidator,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  initialValue: _receipt.aadhar != 0
                      ? _receipt.ammount.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.badge,
                  hint: PaymentText.AADHAR_INPUT_TEXT,
                  onChanged: _receipt.setAadhar,
                  validator: _receipt.aadharValidator,
                  isNumberInput: true,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  initialValue:
                      _receipt.bank != null && _receipt.bank!.isNotEmpty
                          ? _receipt.bank.toString()
                          : DefaultTexts.EMPTY,
                  prefixIcon: Icons.account_balance,
                  hint: PaymentText.BANK_NAME_INPUT_TEXT,
                  onChanged: _receipt.setBank,
                  validator: _receipt.bankValidator,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onReceiptAmountChange(String amount, BuildContext context) {
    if (amount.isNotEmpty && double.tryParse(amount) != null) {
      _receipt.setAmmount(amount);
      BlocProvider.of<UnsortedAmountCubit>(context)
          .setReceiptAmount(amount: double.parse(amount));
    } else if (amount.isEmpty) {
      BlocProvider.of<UnsortedAmountCubit>(context).setReceiptAmount(amount: 0);
    }
  }
}
