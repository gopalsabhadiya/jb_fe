part of 'search_order_bloc.dart';

abstract class SearchOrderEvent extends Equatable {
  const SearchOrderEvent();
}

class SearchOrder extends SearchOrderEvent {
  final String searchTerm;

  const SearchOrder({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}

class ClearSearchOrderTerm extends SearchOrderEvent {
  @override
  List<Object?> get props => [];
}
