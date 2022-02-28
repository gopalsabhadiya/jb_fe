import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jb_fe/controllers/bloc/authentication/drawer/drawer_event.dart';
import 'package:jb_fe/controllers/bloc/authentication/drawer/drawer_state.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  final log = getLogger<DrawerBloc>();

  DrawerBloc(DrawerState initialState) : super(initialState) {
    on<DrawerEvent>(_onDrawerEvent);
  }

  DrawerState get initialState {
    return DrawerState.CLOSED;
  }

  FutureOr<void> _onDrawerEvent(DrawerEvent event, Emitter<DrawerState> emit) {
    log.logEvent<DrawerEvent>();

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
