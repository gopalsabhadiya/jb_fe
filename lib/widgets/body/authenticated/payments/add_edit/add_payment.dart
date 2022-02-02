import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/receipt/new_receipt/add_receipt_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/payment_form.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class AddPayment extends StatefulWidget {
  final VoidCallback _closeDrawer;

  const AddPayment({Key? key, required closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SaveCancelBar(
            cancelCallback: _cancelSave,
            saveCallback: () => _saveCallback(context),
          ),
          BlocConsumer<AddReceiptBloc, AddReceiptState>(
            listener: (context, state) {
              if (state.status == AddReceiptStatus.COMPLETED) {
                _cancelSave();
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case AddReceiptStatus.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AddReceiptStatus.LOADING_UNPAID_ORDERS:
                case AddReceiptStatus.BUILDING:
                case AddReceiptStatus.COMPLETED:
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: PaymentForm(
                          closeDrawer: widget._closeDrawer,
                        ),
                      ),
                    ),
                  );
                case AddReceiptStatus.ERROR:
                  return AppTextBuilder("Opps Something went wrong").build();
              }
            },
          ),
        ],
      ),
    );
  }

  _saveCallback(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AddReceiptBloc>(context).add(SaveReceipt());
    }
  }

  void _cancelSave() {
    print("Cancel Save Item");
    widget._closeDrawer();
  }
}
