import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/constants/stream/AuthenticationStatus.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/events/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';
import 'package:jb_fe/screens/homescreen_content.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenLayout();
  }
}

class _HomeScreenLayout extends State<HomeScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {
        if (state.status == AuthenticationStatus.UNKNOWN) {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationValidationRequested());
        }
      },
      builder: (BuildContext context, AuthenticationState state) {
        switch (state.status) {
          case AuthenticationStatus.UNKNOWN:
            return AppTextBuilder("Loading").build();
          case AuthenticationStatus.AUTHENTICATED:
            return const HomeScreenContent(type: ScreenTypeEnum.AUTHENTICATED);
          case AuthenticationStatus.LOADING:
            return AppTextBuilder("Loading").build();
          case AuthenticationStatus.UNAUTHENTICATED:
            return const HomeScreenContent(
                type: ScreenTypeEnum.UNAUTHENTICATED);
        }
      },
    );
  }
}
