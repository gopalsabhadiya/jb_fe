part of 'search_item_bloc.dart';

abstract class SearchItemEvent extends Equatable {
  const SearchItemEvent();
}

class SearchItem extends SearchItemEvent {
  final String searchTerm;

  const SearchItem({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}

class ClearSearchItemTerm extends SearchItemEvent {
  @override
  List<Object?> get props => [];
}
