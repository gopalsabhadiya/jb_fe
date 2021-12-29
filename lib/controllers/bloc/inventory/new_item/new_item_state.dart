part of 'new_item_bloc.dart';

abstract class NewItemState extends Equatable {
  const NewItemState();
}

class NewItemInitial extends NewItemState {
  @override
  List<Object> get props => [];
}
