import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/end_drawer/profile_or_settings/profile_or_settings_cubit.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/end_drawer/settings/settings.dart';

import 'profile/profile.dart';

class AuthenticatedEndDrawer extends StatefulWidget {
  const AuthenticatedEndDrawer({Key? key}) : super(key: key);

  @override
  State<AuthenticatedEndDrawer> createState() => _AuthenticatedEndDrawerState();
}

class _AuthenticatedEndDrawerState extends State<AuthenticatedEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileOrSettingsCubit, ProfileOrSettingsState>(
      builder: (context, state) {
        if (state.toggleForEndDrawer is ToggleForProfile) {
          return const Drawer(
            child: EndDrawerProfile(),
          );
        } else if (Scaffold.of(context).isEndDrawerOpen &&
            state.toggleForEndDrawer is ToggleForSettings) {
          return const SizedBox(
            width: double.maxFinite,
            child: Drawer(
              child: EndDrawerSettings(),
            ),
          );
        }
        return Container();
      },
    );
  }
}
