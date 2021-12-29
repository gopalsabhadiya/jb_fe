import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_item_event.dart';
part 'update_item_state.dart';

class UpdateItemBloc extends Bloc<UpdateItemEvent, UpdateItemState> {
  UpdateItemBloc() : super(UpdateItemInitial()) {
    on<UpdateItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
