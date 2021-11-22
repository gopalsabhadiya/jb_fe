import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/controllers/bloc/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';
import 'package:jb_fe/screens/authenticated/home_screen.dart';
import 'package:jb_fe/screens/unauthenticated/home_screen.dart';
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
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      final Future<String> _csrfToken =
          AppSharedPreference.getString(key: "csrf");

      return FutureBuilder(
          future: _csrfToken,
          builder: (context, snapshot) {
            switch (state) {
              case AuthenticationState.UNKNOWN:
                if (snapshot.data.toString().isNotEmpty) {
                  return const AuthenticatedHomeScreen();
                }
                return const UnauthenticatedHomeScreen();
              case AuthenticationState.UNAUTHENTICATED:
                return const UnauthenticatedHomeScreen();
              case AuthenticationState.AUTHENTICATED:
                return const AuthenticatedHomeScreen();
              case AuthenticationState.LOADING:
                return AppTextBuilder("Loading").build();
              case AuthenticationState.FAILURE:
                return AppTextBuilder("Something went wrong").build();
            }
          });
    });
  }
}
