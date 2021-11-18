import 'package:bloc/bloc.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc(DrawerState initialState) : super(initialState);

  DrawerState get initialState {
    return DrawerState.CLOSED;
  }

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async* {
    switch (event) {
      case DrawerEvent.OPEN:
        yield DrawerState.OPEN;
        break;
      case DrawerEvent.CLOSE:
        yield DrawerState.CLOSED;
        break;
    }
  }
}
