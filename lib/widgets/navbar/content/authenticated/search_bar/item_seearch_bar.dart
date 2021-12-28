import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

class ItemSearchBar extends StatelessWidget {
  const ItemSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }

  _clearSearchTerm(BuildContext context) {
    BlocProvider.of<SearchPartyBloc>(context).add(ClearSearchTerm());
  }

  _onInventorySearchChange(String value) {
    print("Inventory Search: $value");
  }

  _inventorySearchClickHandler(BuildContext context, String searchText) {
    print("Searching Items: $searchText");
  }
}
