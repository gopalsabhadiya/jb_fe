import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/stream/AuthenticationStatus.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/drawer.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/body.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/drawer.dart';
import 'package:jb_fe/widgets/navbar/content/authenticated/end_drawer.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/drawer.dart';
import 'package:jb_fe/widgets/navbar/navbar.dart';

class HomeScreenContent extends StatelessWidget {
  final ScreenTypeEnum type;
  const HomeScreenContent({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DrawerBloc>(
      create: (context) => DrawerBloc(DrawerState.CLOSED),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(ResponsiveHelper.screenWidth(context), 70),
            child: const AppNavbar()),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            return Scaffold(
              key: AppGlobalKeys.getBodyScaffoldKey(type),
              onDrawerChanged: (status) => _fireDrawerEvent(context),
              drawer: ScreenSizeUtil.displayDrawer(context)
                  ? state.status == AuthenticationStatus.AUTHENTICATED
                      ? AuthenticatedDrawer()
                      : UnauthenticatedDrawer()
                  : null,
              endDrawer: state.status == AuthenticationStatus.AUTHENTICATED
                  ? AuthenticatedEndDrawer()
                  : null,
              body: const AppBody(),
            );
          },
        ),
      ),
    );
  }

  _fireDrawerEvent(BuildContext context) {
    if (AppGlobalKeys.getBodyScaffoldKey(type).currentState!.isDrawerOpen) {
      context.read<DrawerBloc>().add(DrawerEvent.OPEN);
    } else if (!AppGlobalKeys.getBodyScaffoldKey(type)
        .currentState!
        .isDrawerOpen) {
      context.read<DrawerBloc>().add(DrawerEvent.CLOSE);
    }
  }
}
