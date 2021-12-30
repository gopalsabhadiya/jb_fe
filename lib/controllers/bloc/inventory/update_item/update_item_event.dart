part of 'update_item_bloc.dart';

abstract class UpdateItemEvent extends Equatable {
  const UpdateItemEvent();
}

class UpdateItem extends UpdateItemEvent {
  final ItemPresentation item;

  const UpdateItem({required this.item});

  @override
  List<Object?> get props => [item];
}
