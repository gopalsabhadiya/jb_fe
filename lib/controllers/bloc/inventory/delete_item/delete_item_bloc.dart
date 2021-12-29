import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_item_event.dart';
part 'delete_item_state.dart';

class DeleteItemBloc extends Bloc<DeleteItemEvent, DeleteItemState> {
  DeleteItemBloc() : super(DeleteItemInitial()) {
    on<DeleteItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
