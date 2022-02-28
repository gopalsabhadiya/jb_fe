import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'party_form_toggle_state.dart';

class PartyFormToggleCubit extends Cubit<PartyFormToggleState> {
  final log = getLogger<PartyFormToggleCubit>();

  PartyFormToggleCubit()
      : super(
          const PartyFormToggleState(),
        );

  void openDrawer({required ToggleForParty toggleForParty}) {
    log.logEventForCubit(eventName: "openDrawer");

    emit(
      PartyFormToggleState(
        toggleForParty: toggleForParty,
      ),
    );
  }

  void closeDrawer() {
    log.logEventForCubit(eventName: "closeDrawer");

    emit(
      const PartyFormToggleState(
        toggleForParty: DoNotToggle(),
      ),
    );
  }
}
