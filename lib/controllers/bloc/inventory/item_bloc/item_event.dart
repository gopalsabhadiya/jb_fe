part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object?> get props => [];
}

class FetchItemFirstPage extends ItemEvent {}

class FetchNextItemPage extends ItemEvent {}

class SearchItemDisplay extends ItemEvent {
  final List<ItemPresentation> searchResult;
  final String searchTerm;

  const SearchItemDisplay({
    required this.searchResult,
    required this.searchTerm,
  });

  @override
  List<Object?> get props => [searchResult, searchTerm];
}
