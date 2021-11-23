import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc(DrawerState initialState) : super(initialState) {
    on<DrawerEvent>(_onDrawerEvent);
  }

  DrawerState get initialState {
    return DrawerState.CLOSED;
  }

  FutureOr<void> _onDrawerEvent(DrawerEvent event, Emitter<DrawerState> emit) {
    switch (event) {
      case DrawerEvent.OPEN:
        emit(DrawerState.OPEN);
        break;
      case DrawerEvent.CLOSE:
        emit(DrawerState.CLOSED);
        break;
    }
  }
}
