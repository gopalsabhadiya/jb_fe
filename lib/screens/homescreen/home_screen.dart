import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/screens/homescreen/homescreen_content.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

import '../../controllers/bloc/authentication/login_logout/authentication_bloc.dart';

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
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        switch (state.status) {
          case AuthenticationStatus.AUTHENTICATED:
            return const HomeScreenContent(type: ScreenTypeEnum.AUTHENTICATED);
          case AuthenticationStatus.LOADING:
            return AppTextBuilder("Loading").build();
          case AuthenticationStatus.UNAUTHENTICATED:
            return const HomeScreenContent(
              type: ScreenTypeEnum.UNAUTHENTICATED,
            );
          case AuthenticationStatus.ERROR:
            print("Handle authentication error state");
            return const HomeScreenContent(
              type: ScreenTypeEnum.UNAUTHENTICATED,
            );
        }
      },
    );
  }
}
