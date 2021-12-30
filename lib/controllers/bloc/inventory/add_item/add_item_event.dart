part of 'add_item_bloc.dart';

abstract class AddItemEvent extends Equatable {
  const AddItemEvent();
}

class AddNewItem extends AddItemEvent {
  final ItemPresentation item;

  const AddNewItem({required this.item});

  @override
  List<Object?> get props => [item];
}
