part of 'item_form_toggle_cubit.dart';

abstract class ToggleForItem extends Equatable {
  const ToggleForItem();
}

class ToggleForItemUpdate extends ToggleForItem {
  final ItemPresentation itemToBeUpdated;

  const ToggleForItemUpdate({required this.itemToBeUpdated});

  @override
  List<Object?> get props => [itemToBeUpdated];
}

class ToggleForNewItem extends ToggleForItem {
  const ToggleForNewItem();
  @override
  List<Object?> get props => [];
}

class DoNotToggle extends ToggleForItem {
  const DoNotToggle();
  @override
  List<Object?> get props => [];
}

class ItemFormToggleState extends Equatable {
  final ToggleForItem toggleForItem;
  const ItemFormToggleState({
    this.toggleForItem = const DoNotToggle(),
  });

  @override
  List<Object?> get props => [toggleForItem];
}
