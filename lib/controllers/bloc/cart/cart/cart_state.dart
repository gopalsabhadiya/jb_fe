part of 'cart_bloc.dart';

enum CartStatus { LOADING, COMPLETED, ERROR }

class CartState extends Equatable {
  final CartStatus status;
  final int totalItemCount;
  final OrderPresentation order;
  final PartyPresentation? party;
  const CartState({
    this.status = CartStatus.COMPLETED,
    this.totalItemCount = 0,
    required this.order,
    this.party,
  });

  CartState copyWith({
    CartStatus? status,
    int? totalItemCount,
    PartyPresentation? party,
    OrderPresentation? order,
  }) {
    return CartState(
      status: status ?? this.status,
      totalItemCount: totalItemCount ?? this.totalItemCount,
      party: party,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [status, totalItemCount, party];
}
