import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/screen_type.dart';
import 'package:jb_fe/controllers/bloc/drawer.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/drawer.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/widgets/body/authenticated/body.dart';
import 'package:jb_fe/widgets/body/unauthenticated/body.dart';
import 'package:jb_fe/widgets/navbar/content/drawer.dart';
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
        body: BlocBuilder<DrawerBloc, DrawerState>(
            builder: (BuildContext context, DrawerState state) {
          return Scaffold(
            key: AppGlobalKeys.getBodyScaffoldKey(type),
            onDrawerChanged: (status) {
              if (AppGlobalKeys.getBodyScaffoldKey(type).currentState!.isDrawerOpen) {
                context.read<DrawerBloc>().add(DrawerEvent.OPEN);
              } else if (!AppGlobalKeys.getBodyScaffoldKey(type).currentState!.isDrawerOpen) {
                context.read<DrawerBloc>().add(DrawerEvent.CLOSE);
              }
            },
            drawer: const AppDrawer(),
            body: _getBody(),
          );
        }),
      ),
    );
  }

  _getScaffoldKey() {
    switch (type) {
      case ScreenTypeEnum.AUTHENTICATED:
        return AppGlobalKeys.AUTH_BODY_SCAFFOLD;
      case ScreenTypeEnum.UNAUTHENTICATED:
        return AppGlobalKeys.UNAUTH_BODY_SCAFFOLD;
    }
  }

  _getBody() {
    switch (type) {
      case ScreenTypeEnum.AUTHENTICATED:
        return const AppBodyAuthenticated();
      case ScreenTypeEnum.UNAUTHENTICATED:
        return const AppBodyUnAuthenticated();
    }
  }
}
