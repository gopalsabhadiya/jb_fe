import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

class OrderSearchBar extends StatelessWidget {
  const OrderSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: AppSearchInput(
        prefixIcon: Icons.shopping_bag,
        hint: OrderText.SEARCH_ORDER_HINT,
        tooltip: OrderText.SEARCH_ORDER_TOOLTIP,
        onChanged: _onOrderSearchChange,
        searchSubmitHandler: (String value) {
          _orderSearchClickHandler(context, value);
        },
        clearSearchResult: () => _clearSearchTerm(context),
      ),
    );
  }

  _clearSearchTerm(BuildContext context) {
    BlocProvider.of<SearchPartyBloc>(context).add(ClearSearchTerm());
  }

  _onOrderSearchChange(String value) {
    print("Order Search: $value");
  }

  _orderSearchClickHandler(BuildContext context, String searchText) {
    print("Searching Orders: $searchText");
  }
}
