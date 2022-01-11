part of 'party_search_for_order_bloc.dart';

enum PartySearchForOrderStatus { LOADING, COMPLETED, ERROR }

class PartySearchForOrderState extends Equatable {
  final PartySearchForOrderStatus status;
  final List<PartyPresentation> result;

  const PartySearchForOrderState({
    this.result = const <PartyPresentation>[],
    this.status = PartySearchForOrderStatus.COMPLETED,
  });

  PartySearchForOrderState copyWith({
    PartySearchForOrderStatus? status,
    List<PartyPresentation>? result,
  }) {
    return PartySearchForOrderState(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [status, result];
}
