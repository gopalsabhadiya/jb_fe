import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_item_event.dart';
part 'new_item_state.dart';

class NewItemBloc extends Bloc<NewItemEvent, NewItemState> {
  NewItemBloc() : super(NewItemInitial()) {
    on<NewItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
