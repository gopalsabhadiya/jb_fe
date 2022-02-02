import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';
import 'package:jb_fe/controllers/bloc/receipt/delete_receipt/delete_receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/receipt_bloc/receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/receipt_form_toggle/receipt_form_toggle_cubit.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/card/payment_card.dart';
import 'package:jb_fe/widgets/body/authenticated/payments/drawer/receipt_form_drawer.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: BlocBuilder<ReceiptBloc, ReceiptState>(
                    builder: (BuildContext context, ReceiptState state) {
                      switch (state.status) {
                        case ReceiptStatus.INITIAL:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case ReceiptStatus.LOADING:
                          _scrollController.jumpTo(
                              _scrollController.position.minScrollExtent);
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case ReceiptStatus.SUCCESS:
                          return BlocProvider<DeleteReceiptBloc>(
                            create: (BuildContext context) =>
                                serviceLocator<DeleteReceiptBloc>()
                                  ..subscribe(
                                    subscriber:
                                        BlocProvider.of<ReceiptBloc>(context),
                                  ),
                            child: Wrap(
                              clipBehavior: Clip.hardEdge,
                              spacing: 40,
                              runSpacing: 40,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              children: _getReceipts(state.receiptList),
                            ),
                          );
                        case ReceiptStatus.FAILURE:
                          return Center(
                            child: AppTextBuilder("Failed to fetch Receipts")
                                .build(),
                          );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          const ReceiptFormDrawer(),
        ],
      ),
    );
  }

  void _onScroll() {
    if (_isBottom && _scrollController.position.extentAfter == 0) {
      BlocProvider.of<ReceiptBloc>(context).add(FetchNextReceiptPage());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  _onViewReceipt(String receiptId) {
    print("View receipt called");
    BlocProvider.of<ReceiptFormToggleCubit>(context).openDrawer(
      toggleForReceipt: ToggleForReceiptDisplay(receiptId: receiptId),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  _getReceipts(List<ReceiptDetailsPresentation> receiptList) {
    return receiptList
        .map(
          (receipt) => PaymentCard(
              receipt: receipt,
              onViewReceipt: () => _onViewReceipt(receipt.id)),
        )
        .toList();
  }
}
