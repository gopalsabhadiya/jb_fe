import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/constants/enum/screen.dart';
import 'package:jb_fe/screens/homescreen/authenticated.dart';
import 'package:jb_fe/screens/homescreen/unauthenticated.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

import '../../controllers/bloc/authentication/login_logout/authentication_bloc.dart';

class HomeScreenContent extends StatelessWidget {
  final ScreenTypeEnum type;
  const HomeScreenContent({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        switch (state.status) {
          case AuthenticationStatus.AUTHENTICATED:
            return const AuthenticatedHomeScreen();
          case AuthenticationStatus.UNAUTHENTICATED:
            return const UnauthenticatedHomeScreen();
          case AuthenticationStatus.LOADING:
            return AppTextBuilder("Loading").build();
          case AuthenticationStatus.ERROR:
            print("Handel authentication error in homescreen_content");
            return AppTextBuilder("Loading").build();
            break;
        }
      },
    );
  }
}
