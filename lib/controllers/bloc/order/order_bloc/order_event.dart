part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrderFirstPage extends OrderEvent {}

class FetchNextOrderPage extends OrderEvent {}

class SearchOrderDisplay extends OrderEvent {
  final List<OrderPresentation> searchResult;
  final String searchTerm;

  const SearchOrderDisplay({
    required this.searchResult,
    required this.searchTerm,
  });

  @override
  List<Object?> get props => [searchResult, searchTerm];
}
