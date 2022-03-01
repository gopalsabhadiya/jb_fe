import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/authentication/drawer/drawer_bloc.dart';
import 'package:jb_fe/controllers/bloc/authentication/drawer/drawer_event.dart';
import 'package:jb_fe/controllers/bloc/authentication/drawer/drawer_state.dart';
import 'package:jb_fe/controllers/bloc/authentication/sidepanel/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/business/business_data/business_data_bloc.dart';
import 'package:jb_fe/controllers/bloc/dashboard/daily_gold_rate/daily_gold_rate_bloc.dart';
import 'package:jb_fe/controllers/bloc/end_drawer/profile_or_settings/profile_or_settings_cubit.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/authenticated_navbar.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/body/body.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/drawer.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/end_drawer/end_drawer.dart';

import '../../injection_container.dart';

class AuthenticatedHomeScreen extends StatelessWidget {
  const AuthenticatedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      AppRouterDelegate.linkLocationNotifier.value =
          AuthenticatedNavbarLinks.DEFAULT_ACTIVE_LINK;
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerBloc>(
            lazy: false, create: (context) => DrawerBloc(DrawerState.CLOSED)),
        BlocProvider<AuthenticatedSidePanelCubit>(
          create: (context) => AuthenticatedSidePanelCubit(
            AuthenticatedSidePanelState.DASHBOARD,
          ),
        ),
        BlocProvider<DailyGoldRateBloc>(
          create: (context) =>
              serviceLocator<DailyGoldRateBloc>()..add(GetTodayGoldRate()),
          lazy: false,
        ),
        BlocProvider<ProfileOrSettingsCubit>(
          create: (context) => serviceLocator<ProfileOrSettingsCubit>(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) => serviceLocator<BusinessDataBloc>()
            ..add(
              FetchBusinessData(),
            ),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: Scaffold(
            key: AppGlobalKeys.getBodyScaffoldKey(ScreenTypeEnum.AUTHENTICATED),
            onDrawerChanged: (status) => _fireDrawerEvent(context),
            drawer: ScreenSizeUtil.displayDrawer(context)
                ? AuthenticatedDrawer()
                : null,
            endDrawer: const AuthenticatedEndDrawer(),
            body: const AppBodyAuthenticated(),
          ),
        );
      }),
    );
  }

  _fireDrawerEvent(BuildContext context) {
    if (AppGlobalKeys.getBodyScaffoldKey(ScreenTypeEnum.AUTHENTICATED)
        .currentState!
        .isDrawerOpen) {
      context.read<DrawerBloc>().add(DrawerEvent.OPEN);
    } else if (!AppGlobalKeys.getBodyScaffoldKey(ScreenTypeEnum.AUTHENTICATED)
        .currentState!
        .isDrawerOpen) {
      context.read<DrawerBloc>().add(DrawerEvent.CLOSE);
    }
  }
}
