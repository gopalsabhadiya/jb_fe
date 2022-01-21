part of 'add_order_bloc.dart';

abstract class AddOrderEvent extends Equatable {
  const AddOrderEvent();
}

class AddItemToOrder extends AddOrderEvent {
  final ItemPresentation item;

  const AddItemToOrder({required this.item});

  @override
  List<Object?> get props => [item];
}

class RemoveItemFromOrder extends AddOrderEvent {
  final ItemPresentation item;

  const RemoveItemFromOrder({required this.item});

  @override
  List<Object?> get props => [item];
}

class DecreaseItemQuantityInOrder extends AddOrderEvent {
  final ItemPresentation item;

  const DecreaseItemQuantityInOrder({required this.item});

  @override
  List<Object?> get props => [item];
}

class AddPartyToOrder extends AddOrderEvent {
  final PartyPresentation party;

  const AddPartyToOrder({required this.party});

  @override
  List<Object?> get props => [party];
}

class AddGoldRate extends AddOrderEvent {
  final double goldRate;

  const AddGoldRate({required this.goldRate});

  @override
  List<Object?> get props => [goldRate];
}

class UpdateScrapAndKasar extends AddOrderEvent {
  @override
  List<Object?> get props => [];
}

class SaveOrder extends AddOrderEvent {
  @override
  List<Object?> get props => [];
}
