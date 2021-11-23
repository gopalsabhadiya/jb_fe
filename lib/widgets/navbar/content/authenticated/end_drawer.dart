import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/router/delegate.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AuthenticatedEndDrawer extends StatefulWidget {
  late final Map<String, bool> _isHovering;

  AuthenticatedEndDrawer({Key? key}) : super(key: key) {
    _isHovering = _getLinksMap();
  }

  @override
  State<AuthenticatedEndDrawer> createState() => _AuthenticatedEndDrawerState();

  Map<String, bool> _getLinksMap() {
    Map<String, bool> hovering = {
      for (var e in UnauthenticatedNavbarLinks.LINKS.keys.toList()) e: false
    };
    return hovering;
  }
}

class _AuthenticatedEndDrawerState extends State<AuthenticatedEndDrawer> {
  String? get activeLink {
    return AppRouterDelegate.linkLocationNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: AppTextBuilder("End drawer User").build());
  }
}
