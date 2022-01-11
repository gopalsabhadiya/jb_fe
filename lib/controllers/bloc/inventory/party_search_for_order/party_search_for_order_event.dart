part of 'party_search_for_order_bloc.dart';

abstract class PartySearchForOrderEvent extends Equatable {
  const PartySearchForOrderEvent();
}

class SearchPartyForOrder extends PartySearchForOrderEvent {
  final String searchTerm;

  const SearchPartyForOrder({required this.searchTerm});
  @override
  // TODO: implement props
  List<Object?> get props => [searchTerm];
}
