import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/controllers/bloc/order/fetch_order/fetch_order_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/save_cancel_bar.dart';

import 'order_content.dart';

class DisplayOrder extends StatelessWidget {
  final String _orderId;
  final VoidCallback _closeDrawer;

  const DisplayOrder({Key? key, required closeDrawer, required String orderId})
      : _closeDrawer = closeDrawer,
        _orderId = orderId,
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
          BlocBuilder<FetchOrderBloc, FetchOrderState>(
            builder: (context, state) {
              print("Re rendering: $state");
              switch (state.status) {
                case FetchOrderStatus.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case FetchOrderStatus.COMPLETED:
                  return OrderDisplayContent(
                    order: state.order!,
                    party: state.party!,
                  );
                case FetchOrderStatus.ERROR:
                  return Center(
                    child:
                        AppTextBuilder("Failed to fetch Order Details").build(),
                  );
              }
              return AppTextBuilder(_orderId).build();
            },
          ),
        ],
      ),
    );
  }

  void _saveOrder() {
    print("Save Order");
    _closeDrawer();
  }

  void _cancelSave() {
    print("Cancel Save Order");
    _closeDrawer();
  }
}
