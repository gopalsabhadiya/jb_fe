import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/helpers/responsive/responsive_helper.dart';
import 'package:jb_fe/widgets/body/authenticated/body.dart';
import 'package:jb_fe/widgets/navbar/navbar.dart';

class AuthenticatedHomeScreen extends StatefulWidget {
  const AuthenticatedHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenLayout();
  }
}

class _HomeScreenLayout extends State<AuthenticatedHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(ResponsiveHelper.screenWidth(context), 70),
        child: const AppNavbar(),
      ),
      body: const AppBodyAuthenticated(),
    );
  }
}
