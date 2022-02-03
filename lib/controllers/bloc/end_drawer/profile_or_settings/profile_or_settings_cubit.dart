import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_or_settings_state.dart';

class ProfileOrSettingsCubit extends Cubit<ProfileOrSettingsState> {
  ProfileOrSettingsCubit() : super(const ProfileOrSettingsState());

  void openDrawer({required ToggleForEndDrawer toggleFor}) {
    emit(
      ProfileOrSettingsState(
        toggleForEndDrawer: toggleFor,
      ),
    );
  }

  void closeDrawer() {
    emit(
      const ProfileOrSettingsState(
        toggleForEndDrawer: DoNotToggle(),
      ),
    );
  }
}
