import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/end_drawer/profile_or_settings/profile_or_settings_cubit.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/buttons/button.dart';

class EndDrawerProfile extends StatelessWidget {
  const EndDrawerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Icon(
                Icons.account_circle,
                size: 155,
                color: AppColors.blue_5,
              ),
              AppTextBuilder("Gopal Sabhadiya")
                  .size(30)
                  .color(AppColors.blue_5)
                  .build(),
              AppTextBuilder("gopal.sabhadiya@gmail.com")
                  .size(15)
                  .color(AppColors.blue_4)
                  .build()
            ],
          ),
          AppButton(
            icon: Icons.settings,
            colorScheme: ButtonColorScheme.BLUE,
            onClick: () => _openSettings(context),
            hint: "Settings",
          )
        ],
      ),
    );
  }

  _openSettings(BuildContext context) async {
    BlocProvider.of<ProfileOrSettingsCubit>(context)
        .openDrawer(toggleFor: const ToggleForSettings());
    Navigator.of(context).pop();
    await Future.delayed(const Duration(milliseconds: 500));
    AppGlobalKeys.getBodyScaffoldKey(ScreenTypeEnum.AUTHENTICATED)
        .currentState!
        .openEndDrawer();
  }
}
