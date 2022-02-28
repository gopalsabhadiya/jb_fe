import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'profile_or_settings_state.dart';

class ProfileOrSettingsCubit extends Cubit<ProfileOrSettingsState> {
  final log = getLogger<ProfileOrSettingsCubit>();

  ProfileOrSettingsCubit() : super(const ProfileOrSettingsState());

  void openDrawer({required ToggleForEndDrawer toggleFor}) {
    log.logEventForCubit(eventName: "openDrawer");

    emit(
      ProfileOrSettingsState(
        toggleForEndDrawer: toggleFor,
      ),
    );
  }

  void closeDrawer() {
    log.logEventForCubit(eventName: "closeDrawer");
    emit(
      const ProfileOrSettingsState(
        toggleForEndDrawer: DoNotToggle(),
      ),
    );
  }
}
