import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/screens/authenticated/home_screen.dart';
import 'package:jb_fe/screens/unauthenticated/home_screen.dart';

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
    final Future<String> _csrfToken =
        AppSharedPreference.getString(key: "csrf");

    return FutureBuilder(
        future: _csrfToken,
        builder: (context, snapshot) {
          if (snapshot.data.toString().isNotEmpty) {
            return const AuthenticatedHomeScreen();
          }
          return const UnauthenticatedHomeScreen();
        });
  }
}
