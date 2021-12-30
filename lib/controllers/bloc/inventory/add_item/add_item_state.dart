part of 'add_item_bloc.dart';

enum AddItemStatus { LOADING, COMPLETED, ERROR }

class AddItemState extends Equatable {
  final AddItemStatus status;

  const AddItemState({this.status = AddItemStatus.COMPLETED});

  @override
  List<Object?> get props => [status];
}
