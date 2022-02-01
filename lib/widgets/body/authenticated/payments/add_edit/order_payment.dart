import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/controllers/bloc/receipt/new_receipt/add_receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/unsorted_amount/unsorted_amount_cubit.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';
import 'package:jb_fe/widgets/common/inputs/text_field.dart';
import 'package:jb_fe/widgets/common/key_value_display.dart';

class PaymentFormOrderDetails extends StatefulWidget {
  final OrderPresentation _order;
  const PaymentFormOrderDetails({Key? key, required OrderPresentation order})
      : _order = order,
        super(key: key);

  @override
  State<PaymentFormOrderDetails> createState() =>
      _PaymentFormOrderDetailsState();
}

class _PaymentFormOrderDetailsState extends State<PaymentFormOrderDetails> {
  late final TextEditingController paymentTextBoxController;

  @override
  void initState() {
    paymentTextBoxController = TextEditingController();
    super.initState();
  }

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
              KeyValueDisplay(
                textKey: "ID",
                value: widget._order.orderId,
                valueColor: AppColors.red_2,
                backgroundColor: AppColors.white,
              ),
              KeyValueDisplay(
                textKey: "Net",
                value: DefaultTexts.RUPEE_SYMBOL +
                    DefaultTexts.SPACE +
                    widget._order.netAmmount.toString(),
                backgroundColor: AppColors.white,
              ),
              KeyValueDisplay(
                textKey: "Paid",
                value: DefaultTexts.RUPEE_SYMBOL +
                    DefaultTexts.SPACE +
                    (widget._order.netAmmount - widget._order.billOutstanding)
                        .toString(),
                valueColor: AppColors.green_1,
                backgroundColor: AppColors.white,
              ),
              KeyValueDisplay(
                textKey: "Due",
                value: DefaultTexts.RUPEE_SYMBOL +
                    DefaultTexts.SPACE +
                    widget._order.billOutstanding.toString(),
                valueColor: AppColors.red_2,
                backgroundColor: AppColors.white,
              ),
              SizedBox(
                width: 250,
                child: AppTextInput(
                  prefixIcon: Icons.sell,
                  hint: PaymentText.ORDER_DEPOSIT_INPUT_TEXT,
                  onChanged: _onChange,
                  controller: paymentTextBoxController,
                ),
              ),
              AppButton(
                hint: "Full",
                onClick: () => _onPayFullClick(context),
                colorScheme: ButtonColorScheme.BLUE,
              )
            ],
          ),
        ),
      ),
    );
  }

  _onPayFullClick(BuildContext context) {
    final UnsortedAmountCubit unsortedAmountCubit =
        BlocProvider.of<UnsortedAmountCubit>(context);
    final AddReceiptBloc receiptBloc = BlocProvider.of<AddReceiptBloc>(context);

    double unsortedAmount = unsortedAmountCubit.state.unsortedAmount;
    double orderPaymentDue = widget._order.billOutstanding;

    unsortedAmountCubit.deduct(
      amount:
          unsortedAmount > orderPaymentDue ? orderPaymentDue : unsortedAmount,
    );
    receiptBloc.add(
      AddPaymentToReceipt(
        order: widget._order,
        amount:
            unsortedAmount > orderPaymentDue ? orderPaymentDue : unsortedAmount,
      ),
    );

    paymentTextBoxController.text =
        (unsortedAmount > orderPaymentDue ? orderPaymentDue : unsortedAmount)
            .toString();

    print("Full button click");
  }

  _onChange(String input) {
    print("Assign Payment med section input on change");
  }
}
