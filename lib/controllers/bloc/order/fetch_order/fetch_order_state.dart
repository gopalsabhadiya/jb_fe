part of 'fetch_order_bloc.dart';

enum FetchOrderStatus { LOADING, COMPLETED, ERROR }

class FetchOrderState extends Equatable {
  final FetchOrderStatus status;
  final OrderPresentation? order;
  final PartyPresentation? party;

  const FetchOrderState({
    this.status = FetchOrderStatus.LOADING,
    this.order,
    this.party,
  });

  FetchOrderState copyWith({
    FetchOrderStatus? status,
    OrderPresentation? order,
    PartyPresentation? party,
  }) {
    return FetchOrderState(
      status: status ?? this.status,
      order: order ?? this.order,
      party: party ?? this.party,
    );
  }

  @override
  List<Object?> get props => [status, order, party];
}
