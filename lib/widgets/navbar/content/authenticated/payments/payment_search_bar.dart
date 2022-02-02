import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/controllers/bloc/receipt/receipt_bloc/receipt_bloc.dart';
import 'package:jb_fe/controllers/bloc/receipt/search_receipt/search_receipt_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

class PaymentSearchBar extends StatelessWidget {
  const PaymentSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchReceiptBloc>(
      create: (context) {
        final SearchReceiptBloc searchReceiptBloc =
            serviceLocator<SearchReceiptBloc>()
              ..subscribe(
                subscriber: BlocProvider.of<ReceiptBloc>(context),
              );
        BlocProvider.of<ReceiptBloc>(context).subscribe(
          subscriber: searchReceiptBloc,
        );
        return searchReceiptBloc;
      },
      child: Builder(builder: (context) {
        return SizedBox(
          width: 300,
          child: AppSearchInput(
            prefixIcon: Icons.credit_card,
            hint: PaymentText.SEARCH_PAYMENT_HINT,
            tooltip: PaymentText.SEARCH_PAYMENT_TOOLTIP,
            onChanged: _onPaymentSearchChange,
            searchSubmitHandler: (String value) {
              _paymentSearchClickHandler(context, value);
            },
            clearSearchResult: () => _clearSearchTerm(context),
          ),
        );
      }),
    );
  }

  _clearSearchTerm(BuildContext context) {
    BlocProvider.of<SearchReceiptBloc>(context).add(ClearSearchReceiptTerm());
  }

  _onPaymentSearchChange(String value) {
    // print("Payment Search: $value");
  }

  _paymentSearchClickHandler(BuildContext context, String searchText) {
    BlocProvider.of<SearchReceiptBloc>(context).add(
      SearchReceipt(
        searchTerm: searchText,
      ),
    );
  }
}
