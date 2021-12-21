import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedSidePanelCubit,
        AuthenticatedSidePanelState>(
      builder: (BuildContext context, AuthenticatedSidePanelState state) {
        final String searchBarHint;
        final String searchBarTooltip;
        final Function(String) onChangeHandler;
        final Function(String) searchSubmitHandler;
        final IconData prefixIcon;
        final Function() filterClickHandler;
        final Function() addClickHandler;

        switch (state) {
          case AuthenticatedSidePanelState.DASHBOARD:
            return Container();
          case AuthenticatedSidePanelState.PARTY:
            searchBarHint = PartyText.SEARCH_PARTY_HINT;
            searchBarTooltip = PartyText.SEARCH_PARTY_TOOLTIP;
            prefixIcon = Icons.account_circle;
            onChangeHandler = _onPartySearchChange;
            searchSubmitHandler = _partySearchClickHandler;
            break;
          case AuthenticatedSidePanelState.INVENTORY:
            searchBarHint = ItemText.SEARCH_ITEM_HINT;
            searchBarTooltip = ItemText.SEARCH_ITEM_TOOLTIP;
            prefixIcon = Icons.inventory;
            onChangeHandler = _onInventorySearchChange;
            searchSubmitHandler = _inventorySearchClickHandler;
            break;
          case AuthenticatedSidePanelState.ORDERS:
            searchBarHint = OrderText.SEARCH_ORDER_HINT;
            searchBarTooltip = OrderText.SEARCH_ORDER_TOOLTIP;
            prefixIcon = Icons.shopping_bag;
            onChangeHandler = _onOrderSearchChange;
            searchSubmitHandler = _orderSearchClickHandler;
            break;
          case AuthenticatedSidePanelState.PAYMENTS:
            searchBarHint = PaymentText.SEARCH_PAYMENT_HINT;
            searchBarTooltip = PaymentText.SEARCH_PAYMENT_TOOLTIP;
            prefixIcon = Icons.credit_card;
            onChangeHandler = _onPaymentSearchChange;
            searchSubmitHandler = _paymentSearchClickHandler;
            break;
          case AuthenticatedSidePanelState.SHOP_EXPENSES:
            return Container();
        }
        return SizedBox(
          width: 300,
          child: AppSearchInput(
            prefixIcon: prefixIcon,
            hint: searchBarHint,
            tooltip: searchBarTooltip,
            onChanged: onChangeHandler,
            searchSubmitHandler: searchSubmitHandler,
          ),
        );
      },
    );
  }

  _onPartySearchChange(String value) {
    print("Party Search: $value");
  }

  _partySearchClickHandler(String searchText) {
    print("Searching party: $searchText");
  }

  _onInventorySearchChange(String value) {
    print("Inventory Search: $value");
  }

  _inventorySearchClickHandler(String searchText) {
    print("Searching Items: $searchText");
  }

  _onOrderSearchChange(String value) {
    print("Order Search: $value");
  }

  _orderSearchClickHandler(String searchText) {
    print("Searching Orders: $searchText");
  }

  _onPaymentSearchChange(String value) {
    print("Payment Search: $value");
  }

  _paymentSearchClickHandler(String searchText) {
    print("Searching Payments: $searchText");
  }
}
