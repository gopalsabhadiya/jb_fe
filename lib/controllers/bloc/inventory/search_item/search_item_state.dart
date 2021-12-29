part of 'search_item_bloc.dart';

abstract class SearchItemState extends Equatable {
  const SearchItemState();
}

class SearchItemInitial extends SearchItemState {
  @override
  List<Object> get props => [];
}
