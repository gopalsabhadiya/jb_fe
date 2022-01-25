part of 'add_order_bloc.dart';

enum AddOrderStatus {
  LOADING,
  COMPLETED,
  BUILDING,
  ERROR,
}

class AddOrderState extends Equatable {
  final AddOrderStatus status;
  final int totalItemCount;
  final OrderPresentation order;
  final PartyPresentation? party;

  const AddOrderState({
    this.status = AddOrderStatus.BUILDING,
    this.totalItemCount = 0,
    required this.order,
    this.party,
  });

  AddOrderState copyWith({
    AddOrderStatus? status,
    int? totalItemCount,
    PartyPresentation? party,
    OrderPresentation? order,
  }) {
    return AddOrderState(
      status: status ?? this.status,
      totalItemCount: totalItemCount ?? this.totalItemCount,
      party: party ?? this.party,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [status, totalItemCount, order, party];
}
