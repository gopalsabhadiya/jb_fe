part of 'search_item_bloc.dart';

abstract class SearchItemEvent extends Equatable {
  const SearchItemEvent();
}

class SearchItem extends SearchItemEvent {
  final String searchTerm;
  final List<ItemPresentation> cartItems;

  const SearchItem({required this.searchTerm, required this.cartItems});

  @override
  List<Object?> get props => [searchTerm];
}

class ClearSearchItemTerm extends SearchItemEvent {
  final List<ItemPresentation> cartItems;

  const ClearSearchItemTerm({required this.cartItems});
  @override
  List<Object?> get props => [cartItems];
}
