import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/controllers/bloc/party/party_bloc/party_bloc.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

import '../../../../../injection_container.dart';

class PartySearchBar extends StatelessWidget {
  const PartySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final SearchPartyBloc searchPartyBloc =
            serviceLocator<SearchPartyBloc>()
              ..subscribe(
                subscriber: BlocProvider.of<PartyBloc>(context),
              );
        BlocProvider.of<PartyBloc>(context)
            .subscribe(subscriber: searchPartyBloc);
        return searchPartyBloc;
      },
      child: Builder(
        builder: (BuildContext context) {
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
        },
      ),
    );
  }

  _clearSearchTerm(BuildContext context) {
    BlocProvider.of<SearchPartyBloc>(context).add(ClearSearchPartyTerm());
  }

  _onPartySearchChange(String value) {
    // print("Party Search: $value");
  }

  _partySearchClickHandler(BuildContext context, String searchText) {
    BlocProvider.of<SearchPartyBloc>(context).add(
      SearchParty(
        searchTerm: searchText,
      ),
    );
  }
}
