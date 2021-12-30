import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

class PaymentSearchBar extends StatelessWidget {
  const PaymentSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }

  _clearSearchTerm(BuildContext context) {
    print("Clear Payment search term here");
  }

  _onPaymentSearchChange(String value) {
    print("Payment Search: $value");
  }

  _paymentSearchClickHandler(BuildContext context, String searchText) {
    print("Searching Payments: $searchText");
  }
}
