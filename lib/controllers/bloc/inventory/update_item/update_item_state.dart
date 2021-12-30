part of 'update_item_bloc.dart';

enum UpdateItemStatus { LOADING, COMPLETED, ERROR }

class UpdateItemState extends Equatable {
  final UpdateItemStatus updateStatus;
  final ItemPresentation? itemToBeUpdated;

  const UpdateItemState({
    this.updateStatus = UpdateItemStatus.COMPLETED,
    this.itemToBeUpdated,
  });

  UpdateItemState copyWith({
    UpdateItemStatus? updateStatus,
    ItemPresentation? itemToBeUpdated,
  }) {
    return UpdateItemState(
      updateStatus: updateStatus ?? this.updateStatus,
      itemToBeUpdated: itemToBeUpdated ?? this.itemToBeUpdated,
    );
  }

  @override
  List<Object?> get props => [updateStatus, itemToBeUpdated];
}
