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

class ReceiptFormMidSection extends StatefulWidget {
  final ReceiptPresentation _receipt;
  const ReceiptFormMidSection({Key? key, required ReceiptPresentation receipt})
      : _receipt = receipt,
        super(key: key);

  @override
  State<ReceiptFormMidSection> createState() => _ReceiptFormMidSectionState();
}

class _ReceiptFormMidSectionState extends State<ReceiptFormMidSection> {
  late final List<FocusNode> _focusNodeList;

  @override
  void initState() {
    _focusNodeList = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodeList) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
                  initialValue: widget._receipt.paymentMode.name(),
                  items: PaymentModeEnum.values.map((e) => e.name()).toList(),
                  prefixIcon: Icons.credit_card,
                  onSetValue: widget._receipt.setPaymentMode,
                  hint: PaymentText.PAYMENT_TYPE_INPUT_TEXT,
                  validator: widget._receipt.paymentModeValidator,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  onEditingComplete: () => _focusNextTextBox(0),
                  focusNode: _focusNodeList[0],
                  initialValue: widget._receipt.ammount != 0
                      ? widget._receipt.ammount.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.sell,
                  hint: PaymentText.AMMOUNT_INPUT_TEXT,
                  onChanged: (String value) =>
                      _onReceiptAmountChange(value, context),
                  validator: widget._receipt.ammountValidator,
                  isNumberInput: true,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  onEditingComplete: () => _focusNextTextBox(1),
                  focusNode: _focusNodeList[1],
                  initialValue: widget._receipt.check != 0
                      ? widget._receipt.check.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.pin,
                  hint: PaymentText.CHECK_NUMBER_INPUT_TEXT,
                  onChanged: widget._receipt.setCheck,
                  validator: widget._receipt.checkValidator,
                  isNumberInput: true,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextInput(
                  onEditingComplete: () => _focusNextTextBox(2),
                  focusNode: _focusNodeList[2],
                  initialValue: widget._receipt.pan != null &&
                          widget._receipt.pan!.isNotEmpty
                      ? widget._receipt.pan.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.badge,
                  hint: PaymentText.PAN_INPUT_TEXT,
                  onChanged: widget._receipt.setPan,
                  validator: widget._receipt.panValidator,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  onEditingComplete: () => _focusNextTextBox(3),
                  focusNode: _focusNodeList[3],
                  initialValue: widget._receipt.aadhar != 0
                      ? widget._receipt.ammount.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.badge,
                  hint: PaymentText.AADHAR_INPUT_TEXT,
                  onChanged: widget._receipt.setAadhar,
                  validator: widget._receipt.aadharValidator,
                  isNumberInput: true,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: AppTextInput(
                  onEditingComplete: () => _focusNextTextBox(4),
                  focusNode: _focusNodeList[4],
                  initialValue: widget._receipt.bank != null &&
                          widget._receipt.bank!.isNotEmpty
                      ? widget._receipt.bank.toString()
                      : DefaultTexts.EMPTY,
                  prefixIcon: Icons.account_balance,
                  hint: PaymentText.BANK_NAME_INPUT_TEXT,
                  onChanged: widget._receipt.setBank,
                  validator: widget._receipt.bankValidator,
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
      widget._receipt.setAmmount(amount);
      BlocProvider.of<UnsortedAmountCubit>(context)
          .setReceiptAmount(amount: double.parse(amount));
    } else if (amount.isEmpty) {
      BlocProvider.of<UnsortedAmountCubit>(context).setReceiptAmount(amount: 0);
    }
  }

  _focusNextTextBox(int currentNodeIndex) {
    if (currentNodeIndex + 1 < _focusNodeList.length) {
      _focusNodeList[currentNodeIndex + 1].requestFocus();
    }
  }
}
