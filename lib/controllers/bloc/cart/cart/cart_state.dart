part of 'cart_bloc.dart';

class CartState extends Equatable {
  final int totalItemCount;
  final List<ItemPresentation> itemList;
  final PartyPresentation? party;
  const CartState({
    this.itemList = const <ItemPresentation>[],
    this.totalItemCount = 0,
    this.party,
  });

  CartState copyWith({
    List<ItemPresentation>? itemList,
    int? totalItemCount,
    PartyPresentation? party,
  }) {
    return CartState(
      itemList: itemList ?? this.itemList,
      totalItemCount: totalItemCount ?? this.totalItemCount,
      party: party,
    );
  }

  @override
  List<Object?> get props => [itemList, totalItemCount, party];
}
