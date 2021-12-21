import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/drawer.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/body/unauthenticated/body.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/drawer.dart';
import 'package:jb_fe/widgets/navbar/navbar.dart';

class UnauthenticatedHomeScreen extends StatelessWidget {
  const UnauthenticatedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      AppRouterDelegate.linkLocationNotifier.value =
          UnauthenticatedNavbarLinks.DEFAULT_ACTIVE_LINK;
    });
    return BlocProvider<DrawerBloc>(
      create: (context) => DrawerBloc(DrawerState.CLOSED),
      child: BlocBuilder<DrawerBloc, DrawerState>(
          builder: (BuildContext context, DrawerState state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: ScreenSizeUtil.getNavbarPreferredSize(context),
              child: const AppNavbar()),
          body: Scaffold(
            key: AppGlobalKeys.getBodyScaffoldKey(
                ScreenTypeEnum.UNAUTHENTICATED),
            onDrawerChanged: (status) => _fireDrawerEvent(context),
            drawer: ScreenSizeUtil.displayDrawer(context)
                ? UnauthenticatedDrawer()
                : null,
            body: AppBodyUnAuthenticated(),
          ),
        );
      }),
    );
  }

  _fireDrawerEvent(BuildContext context) {
    print("Drawer event fired");
    if (AppGlobalKeys.getBodyScaffoldKey(ScreenTypeEnum.UNAUTHENTICATED)
        .currentState!
        .isDrawerOpen) {
      print('Drawer event: if');
      BlocProvider.of<DrawerBloc>(context).add(DrawerEvent.OPEN);
    } else if (!AppGlobalKeys.getBodyScaffoldKey(ScreenTypeEnum.UNAUTHENTICATED)
        .currentState!
        .isDrawerOpen) {
      print('Drawer event: else if');

      BlocProvider.of<DrawerBloc>(context).add(DrawerEvent.CLOSE);
    }
  }
}
