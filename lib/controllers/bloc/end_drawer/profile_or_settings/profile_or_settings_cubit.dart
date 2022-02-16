import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_or_settings_state.dart';

class ProfileOrSettingsCubit extends Cubit<ProfileOrSettingsState> {
  ProfileOrSettingsCubit() : super(const ProfileOrSettingsState());

  void openDrawer({required ToggleForEndDrawer toggleFor}) {
    print("Opening drwaer: ${toggleFor}");
    emit(
      ProfileOrSettingsState(
        toggleForEndDrawer: toggleFor,
      ),
    );
  }

  void closeDrawer() {
    print("Closing drawer");
    emit(
      const ProfileOrSettingsState(
        toggleForEndDrawer: DoNotToggle(),
      ),
    );
  }
}
