part of 'update_item_bloc.dart';

enum UpdateItemStatus { LOADING, COMPLETED, ERROR }

class UpdateItemState extends Equatable {
  final UpdateItemStatus status;
  final ItemPresentation? itemToBeUpdated;

  const UpdateItemState({
    this.status = UpdateItemStatus.COMPLETED,
    this.itemToBeUpdated,
  });

  UpdateItemState copyWith({
    UpdateItemStatus? status,
    ItemPresentation? itemToBeUpdated,
  }) {
    return UpdateItemState(
      status: status ?? this.status,
      itemToBeUpdated: itemToBeUpdated ?? this.itemToBeUpdated,
    );
  }

  @override
  List<Object?> get props => [status, itemToBeUpdated];
}
