part of 'profile_or_settings_cubit.dart';

class ProfileOrSettingsState extends Equatable {
  final ToggleForEndDrawer toggleForEndDrawer;
  const ProfileOrSettingsState({
    this.toggleForEndDrawer = const DoNotToggle(),
  });

  @override
  List<Object?> get props => [toggleForEndDrawer];
}

abstract class ToggleForEndDrawer extends Equatable {
  const ToggleForEndDrawer();
}

class ToggleForProfile extends ToggleForEndDrawer {
  const ToggleForProfile();

  @override
  List<Object?> get props => [];
}

class ToggleForSettings extends ToggleForEndDrawer {
  const ToggleForSettings();
  @override
  List<Object?> get props => [];
}

class DoNotToggle extends ToggleForEndDrawer {
  const DoNotToggle();
  @override
  List<Object?> get props => [];
}
