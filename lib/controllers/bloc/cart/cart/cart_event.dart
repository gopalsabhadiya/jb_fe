part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddItemToCart extends CartEvent {
  final ItemPresentation item;

  const AddItemToCart({required this.item});

  @override
  List<Object?> get props => [item];
}

class RemoveItemFromCart extends CartEvent {
  final ItemPresentation item;

  const RemoveItemFromCart({required this.item});

  @override
  List<Object?> get props => [item];
}

class DecreaseItemQuantityInCart extends CartEvent {
  final ItemPresentation item;

  const DecreaseItemQuantityInCart({required this.item});

  @override
  List<Object?> get props => [item];
}

class AddPartyToCart extends CartEvent {
  final PartyPresentation party;

  const AddPartyToCart({required this.party});

  @override
  List<Object?> get props => [party];
}
