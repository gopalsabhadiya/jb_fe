part of 'delete_item_bloc.dart';

abstract class DeleteItemEvent extends Equatable {
  const DeleteItemEvent();
}

class DeleteItem extends DeleteItemEvent {
  final String itemIdToBeDeleted;

  const DeleteItem({required this.itemIdToBeDeleted});

  @override
  List<Object?> get props => [itemIdToBeDeleted];
}
