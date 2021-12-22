import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/constants/texts/order_text.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/constants/texts/payment_text.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/search_party/search_party_bloc.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

import '../../../../injection_container.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedSidePanelCubit,
        AuthenticatedSidePanelState>(
      builder: (BuildContext context, AuthenticatedSidePanelState state) {
        switch (state) {
          case AuthenticatedSidePanelState.DASHBOARD:
            return Container();
          case AuthenticatedSidePanelState.PARTY:
            return BlocProvider(
              create: (context) {
                final SearchPartyBloc searchPartyBloc =
                    serviceLocator<SearchPartyBloc>();

                searchPartyBloc.stream.listen(
                  (event) {
                    print(
                        "Your search term in search bar: ${event.searchTerm}");
                    print(
                        "Your search result in search bar: ${event.result.length}");
                    if (event.searchStatus == SearchPartyStatus.COMPLETED) {
                      BlocProvider.of<PartyBloc>(context).add(
                        SearchPartyDisplay(
                          searchResult: event.result,
                          searchTerm: event.searchTerm,
                        ),
                      );
                    }
                  },
                );
                return searchPartyBloc;
              },
              child: Builder(builder: (context) {
                return SizedBox(
                  width: 300,
                  child: AppSearchInput(
                    prefixIcon: Icons.account_circle,
                    hint: PartyText.SEARCH_PARTY_HINT,
                    tooltip: PartyText.SEARCH_PARTY_TOOLTIP,
                    onChanged: _onPartySearchChange,
                    searchSubmitHandler: (String value) {
                      _partySearchClickHandler(context, value);
                    },
                    clearSearchResult: () => _clearSearchTerm(context),
                  ),
                );
              }),
            );
          case AuthenticatedSidePanelState.INVENTORY:
            return SizedBox(
              width: 300,
              child: AppSearchInput(
                prefixIcon: Icons.inventory,
                hint: ItemText.SEARCH_ITEM_HINT,
                tooltip: ItemText.SEARCH_ITEM_TOOLTIP,
                onChanged: _onInventorySearchChange,
                searchSubmitHandler: (String value) {
                  _inventorySearchClickHandler(context, value);
                },
                clearSearchResult: () => _clearSearchTerm(context),
              ),
            );
            break;
          case AuthenticatedSidePanelState.ORDERS:
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
            break;
          case AuthenticatedSidePanelState.PAYMENTS:
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
            break;
          case AuthenticatedSidePanelState.SHOP_EXPENSES:
            return Container();
        }
      },
    );
  }

  _clearSearchTerm(BuildContext context) {
    print("Clear search term");
    print(
        "PartyBlocState: ${BlocProvider.of<PartyBloc>(context).state.searchTerm}");
    BlocProvider.of<PartyBloc>(context).add(ClearSearchTerm());
    print(
        "PartyBlocState: ${BlocProvider.of<PartyBloc>(context).state.searchTerm}");
  }

  _onPartySearchChange(String value) {
    // print("Party Search: $value");
  }

  _partySearchClickHandler(BuildContext context, String searchText) {
    print("Searching party: $searchText");
    BlocProvider.of<SearchPartyBloc>(context)
        .add(SearchParty(searchTerm: searchText));
  }

  _onInventorySearchChange(String value) {
    print("Inventory Search: $value");
  }

  _inventorySearchClickHandler(BuildContext context, String searchText) {
    print("Searching Items: $searchText");
  }

  _onOrderSearchChange(String value) {
    print("Order Search: $value");
  }

  _orderSearchClickHandler(BuildContext context, String searchText) {
    print("Searching Orders: $searchText");
  }

  _onPaymentSearchChange(String value) {
    print("Payment Search: $value");
  }

  _paymentSearchClickHandler(BuildContext context, String searchText) {
    print("Searching Payments: $searchText");
  }
}
