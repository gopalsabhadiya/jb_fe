import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/drawer.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/authenticated_sidepanel.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/authenticated_navbar.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/authenticated/body.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/drawer.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/end_drawer.dart';
import 'package:jb_fe/widgets/navbar/navbar.dart';

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
            create: (context) =>
                AuthenticatedSidePanelCubit(AuthenticatedSidePanelState.PARTY))
      ],
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: ScreenSizeUtil.getNavbarPreferredSize(context),
                child: const AppNavbar()),
            body: Scaffold(
              key: AppGlobalKeys.getBodyScaffoldKey(
                  ScreenTypeEnum.AUTHENTICATED),
              onDrawerChanged: (status) => _fireDrawerEvent(context),
              drawer: ScreenSizeUtil.displayDrawer(context)
                  ? AuthenticatedDrawer()
                  : null,
              endDrawer: AuthenticatedEndDrawer(),
              body: const AppBodyAuthenticated(),
            ));
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
