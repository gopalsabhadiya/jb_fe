import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/stream/AuthenticationStatus.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/drawer.dart';
import 'package:jb_fe/controllers/bloc/events/drawer.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';
import 'package:jb_fe/screens/homescreen/authenticated.dart';
import 'package:jb_fe/screens/homescreen/unauthenticated.dart';
import 'package:jb_fe/util/global_keys.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class HomeScreenContent extends StatelessWidget {
  final ScreenTypeEnum type;
  const HomeScreenContent({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        switch (state.status) {
          case AuthenticationStatus.UNKNOWN:
            return const UnauthenticatedHomeScreen();
          case AuthenticationStatus.AUTHENTICATED:
            return const AuthenticatedHomeScreen();
          case AuthenticationStatus.UNAUTHENTICATED:
            return const UnauthenticatedHomeScreen();
          case AuthenticationStatus.LOADING:
            return AppTextBuilder("Loading").build();
        }
      },
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
