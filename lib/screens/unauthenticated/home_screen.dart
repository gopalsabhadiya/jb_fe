import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/navbar_types_enum.dart';
import 'package:jb_fe/controllers/bloc/drawer.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/util/screen_size.dart';
import 'package:jb_fe/widgets/body/unauthenticated/body.dart';
import 'package:jb_fe/widgets/navbar/content/unauthenticated/drawer.dart';
import 'package:jb_fe/widgets/navbar/navbar.dart';

class UnauthenticatedHomeScreen extends StatelessWidget {
  const UnauthenticatedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DrawerBloc>(
      create: (context) => DrawerBloc(DrawerState.CLOSED),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(ResponsiveHelper.screenWidth(context), 70),
            child: const AppNavbar()),
        body: BlocBuilder<DrawerBloc, DrawerState>(
            builder: (BuildContext context, DrawerState state) {
          return Scaffold(
              key: AppGlobalKeys.UNAUTH_BODY_SCAFFOLD,
              onDrawerChanged: (status) {
                if (AppGlobalKeys
                    .UNAUTH_BODY_SCAFFOLD.currentState!.isDrawerOpen) {
                  context.read<DrawerBloc>().add(DrawerEvent.OPEN);
                } else if (!AppGlobalKeys
                    .UNAUTH_BODY_SCAFFOLD.currentState!.isDrawerOpen) {
                  context.read<DrawerBloc>().add(DrawerEvent.CLOSE);
                }
              },
              drawer: ScreenSizeUtil.getNavbarType(context) ==
                      NavbarTypes.SIDE_HAMBURGER_UNAUTHENTICATED
                  ? UnauthenticatedDrawer()
                  : null,
              body: const AppBodyUnAuthenticated());
        }),
      ),
    );
  }
}
