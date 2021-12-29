import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

part 'party_form_toggle_state.dart';

class PartyFormToggleCubit extends Cubit<PartyFormToggleState> {
  PartyFormToggleCubit()
      : super(
          const PartyFormToggleState(),
        );

  void openDrawer({required ToggleForParty toggleForParty}) => emit(
        PartyFormToggleState(
          toggleForParty: toggleForParty,
        ),
      );
  void closeDrawer() => emit(
        const PartyFormToggleState(
          toggleForParty: DoNotToggle(),
        ),
      );
}
