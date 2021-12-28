import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'party_form_toggle_state.dart';

class PartyFormToggleCubit extends Cubit<PartyFormToggleState> {
  PartyFormToggleCubit() : super(const PartyFormToggleState(isOpen: true));

  void openDrawer() => emit(const PartyFormToggleState(isOpen: true));
  void closeDrawer() => emit(const PartyFormToggleState(isOpen: false));
}
