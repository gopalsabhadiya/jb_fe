import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/receipt/new_receipt/add_receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/unsorted_amount/unsorted_amount_cubit.dart';
import 'package:jb_fe/widgets/common/instruction_banner.dart';

import '../../../../../../injection_container.dart';
import '../orders_section.dart';
import 'mid_section.dart';

class ReceiptSectionForCart extends StatelessWidget {
  final VoidCallback _closeDrawer;

  const ReceiptSectionForCart({Key? key, required VoidCallback closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 1000),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: BlocBuilder<AddReceiptBloc, AddReceiptState>(
        builder: (BuildContext context, AddReceiptState state) {
          if (state.party == null) {
            return InstructionBanner(
              callback: _closeDrawer,
              instruction: "Party not selected. Please, select party first.",
            );
          }
          return BlocProvider(
            create: (context) => serviceLocator<UnsortedAmountCubit>(),
            child: Column(
              children: [
                ReceiptFormMidSection(
                  receipt: state.receipt,
                ),
                PaymentFormOrderSection(
                  unpaidOrderList: state.unpaidOrderList!,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
