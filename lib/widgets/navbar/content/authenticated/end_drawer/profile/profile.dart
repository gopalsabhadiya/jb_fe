import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/end_drawer/profile_or_settings/profile_or_settings_cubit.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';

import '../../../../../../controllers/bloc/authentication/login_logout/authentication_bloc.dart';

class EndDrawerProfile extends StatelessWidget {
  const EndDrawerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 155,
                    color: AppColors.blue_5,
                  ),
                  AppTextBuilder(state.user!.name)
                      .size(30)
                      .color(AppColors.blue_5)
                      .build(),
                  AppTextBuilder(state.user!.email)
                      .size(15)
                      .color(AppColors.blue_4)
                      .build(),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    icon: Icons.settings,
                    colorScheme: ButtonColorScheme.BLUE,
                    onClick: () => _openSettings(context),
                    hint: "Settings",
                  )
                ],
              );
            },
          ),
          AppButton(
            icon: Icons.logout,
            colorScheme: ButtonColorScheme.BLUE,
            onClick: () => _logout(context),
            hint: "Logout",
          )
        ],
      ),
    );
  }

  _openSettings(BuildContext context) async {
    Navigator.of(context).pop();
    BlocProvider.of<ProfileOrSettingsCubit>(context)
        .openDrawer(toggleFor: const ToggleForSettings());
    await Future.delayed(const Duration(milliseconds: 400));
    AppGlobalKeys.getBodyScaffoldKey(ScreenTypeEnum.AUTHENTICATED)
        .currentState!
        .openEndDrawer();
  }

  _logout(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(UnAuthenticate());
  }
}
