import 'package:bloc/bloc.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';

class AuthenticatedSidePanelCubit extends Cubit<AuthenticatedSidePanelState> {
  AuthenticatedSidePanelCubit(AuthenticatedSidePanelState initialState)
      : super(initialState);

  void navigateTo(String link) =>
      emit(AuthenticatedSidePanelState.values.firstWhere(
          (e) => e.toString().toLowerCase().contains(link.toLowerCase())));
}
