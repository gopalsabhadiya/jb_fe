import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/durations/animation_durations.dart';
import 'package:jb_fe/controllers/bloc/receipt/fetch_receipt/fetch_receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/new_receipt/add_receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/receipt_bloc/receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/receipt_form_toggle/receipt_form_toggle_cubit.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/add_edit/edit_payment.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/view/display_receipt.dart';

import '../../../../../injection_container.dart';

class ReceiptFormDrawer extends StatefulWidget {
  const ReceiptFormDrawer({Key? key}) : super(key: key);

  @override
  State<ReceiptFormDrawer> createState() => _ReceiptFormDrawerState();
}

class _ReceiptFormDrawerState extends State<ReceiptFormDrawer>
    with TickerProviderStateMixin {
  late Animation<Offset> animation;

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: AnimationDuration.SHORT,
    );
    animation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        width: ScreenSizeUtil.getBottomDrawerWidth(context),
        height: ScreenSizeUtil.getBottomDrawerHeight(context),
        color: AppColors.blue_1,
        child: BlocBuilder<ReceiptFormToggleCubit, ReceiptFormToggleState>(
          builder: (context, state) {
            if (state.toggleForReceipt is ToggleForNewReceipt) {
              _openDrawer();
              return BlocProvider<AddReceiptBloc>(
                create: (BuildContext context) =>
                    serviceLocator<AddReceiptBloc>()
                      ..subscribe(
                        subscriber: BlocProvider.of<ReceiptBloc>(context),
                      ),
                child: EditPayment(
                  toggleDrawer: _openDrawer,
                ),
              );
            }
            if (state.toggleForReceipt is ToggleForReceiptDisplay) {
              _openDrawer();
              return BlocProvider<FetchReceiptBloc>(
                create: (BuildContext context) =>
                    serviceLocator<FetchReceiptBloc>()
                      ..add(
                        FetchReceipt(
                          receiptIdToBeFetched: (state.toggleForReceipt
                                  as ToggleForReceiptDisplay)
                              .receiptId,
                        ),
                      ),
                child: ViewReceipt(
                  closeDrawer: _closeDrawer,
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _openDrawer() {
    animationController.forward();
  }

  void _closeDrawer() {
    animationController.reverse();
  }

  _cancelUpdate() {
    _closeDrawer();
    BlocProvider.of<ReceiptFormToggleCubit>(context).closeDrawer();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
