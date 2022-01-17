import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/texts/item_text.dart';
import 'package:jb_fe/controllers/bloc/cart/cart/cart_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/item_bloc/item_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/search_item/search_item_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

class ItemSearchBar extends StatelessWidget {
  const ItemSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchItemBloc>(
      create: (BuildContext context) {
        final SearchItemBloc searchItemBloc = serviceLocator<SearchItemBloc>()
          ..subscribe(subscriber: BlocProvider.of<ItemBloc>(context));
        BlocProvider.of<ItemBloc>(context)
            .subscribe(subscriber: searchItemBloc);
        return searchItemBloc;
      },
      child: Builder(builder: (BuildContext context) {
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
      }),
    );
  }

  _clearSearchTerm(BuildContext context) {
    BlocProvider.of<SearchItemBloc>(context).add(
      ClearSearchItemTerm(
        cartItems: BlocProvider.of<CartBloc>(context).state.order.items,
      ),
    );
  }

  _onInventorySearchChange(String value) {
    print("Inventory Search: $value");
  }

  _inventorySearchClickHandler(BuildContext context, String searchTerm) {
    BlocProvider.of<SearchItemBloc>(context).add(
      SearchItem(
        searchTerm: searchTerm,
        cartItems: BlocProvider.of<CartBloc>(context).state.order.items,
      ),
    );
  }
}
