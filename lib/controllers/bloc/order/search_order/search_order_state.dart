part of 'search_order_bloc.dart';

enum SearchOrderStatus { LOADING, COMPLETED, ERROR }

class SearchOrderState extends Equatable {
  final SearchOrderStatus searchStatus;
  final String searchTerm;
  final List<OrderPresentation> result;

  const SearchOrderState({
    this.searchStatus = SearchOrderStatus.COMPLETED,
    this.searchTerm = DefaultTexts.EMPTY,
    this.result = const <OrderPresentation>[],
  });

  SearchOrderState copyWith({
    SearchOrderStatus? searchStatus,
    String? searchTerm,
    List<OrderPresentation>? result,
  }) {
    return SearchOrderState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchTerm: searchTerm ?? this.searchTerm,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [searchStatus, result, searchTerm];
}
