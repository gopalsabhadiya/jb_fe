import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/receipt/fetch_receipt/fetch_receipt_bloc.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/view/receipt_content.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

class ViewReceipt extends StatelessWidget {
  final VoidCallback _closeDrawer;

  const ViewReceipt({Key? key, required VoidCallback closeDrawer})
      : _closeDrawer = closeDrawer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SaveCancelBar(
            cancelCallback: _cancelSave,
            saveString: "Okay",
            saveCallback: _cancelSave,
          ),
          // const Expanded(child: OrderForm()),
          BlocBuilder<FetchReceiptBloc, FetchReceiptState>(
            builder: (context, state) {
              switch (state.status) {
                case FetchReceiptStatus.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case FetchReceiptStatus.COMPLETED:
                  return ReceiptDisplayContent(
                    receipt: state.receipt!,
                    orders: state.orders!,
                    party: state.party!,
                  );
                case FetchReceiptStatus.ERROR:
                  return Center(
                    child:
                        AppTextBuilder("Failed to fetch Order Details").build(),
                  );
              }
            },
          ),
        ],
      ),
    );
  }

  void _cancelSave() {
    print("Cancel Save Order");
    _closeDrawer();
  }
}
