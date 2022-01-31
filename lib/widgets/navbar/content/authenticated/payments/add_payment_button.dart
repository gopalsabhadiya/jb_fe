import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/receipt_form_toggle/receipt_form_toggle_cubit.dart';
import 'package:jb_fe/widgets/common/buttons/icon_button_circle.dart';

class AddPaymentButton extends StatelessWidget {
  const AddPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AppIconButtonCircleBuilder(Icons.add)
          .onClickHandler(
            () => BlocProvider.of<ReceiptFormToggleCubit>(context).openDrawer(
              toggleForReceipt: const ToggleForNewReceipt(),
            ),
          )
          .build(),
    );
  }
}
