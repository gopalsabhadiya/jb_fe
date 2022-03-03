import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/injection_container.dart';
import 'package:jb_fe/router/config.dart';
import 'package:jb_fe/screens/homescreen/home_screen.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/unknown_screen.dart';

import '../controllers/bloc/authentication/login_logout/authentication_bloc.dart';

class AppRouterDelegate extends RouterDelegate<AppRouterConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AppRouterConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _homePage;

  // App state fields
  static final ValueNotifier<String?> linkLocationNotifier =
      ValueNotifier(null);
  static final ValueNotifier<bool?> unknownStateNotifier = ValueNotifier(null);

  AppRouterDelegate() {
    _homePage = MaterialPage(
      key: const ValueKey<String>("HomePage"),
      child: BlocProvider<AuthenticationBloc>(
        create: (_) =>
            serviceLocator<AuthenticationBloc>()..add(ValidateAuthentication()),
        child: const HomeScreenLayout(),
      ),
    );

    Listenable.merge([linkLocationNotifier, unknownStateNotifier])
        .addListener(() {
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  AppRouterConfiguration get currentConfiguration {
    if (linkLocationNotifier.value != null) {
      return AppRouterConfiguration.link(link: linkLocationNotifier.value);
    }
    linkLocationNotifier.value = UnauthenticatedNavbarLinks.DEFAULT_ACTIVE_LINK;
    return AppRouterConfiguration.link(
        link: UnauthenticatedNavbarLinks.DEFAULT_ACTIVE_LINK);
  }

  @override
  Widget build(BuildContext context) {
    final colorCode = linkLocationNotifier.value;
    return Navigator(
      key: navigatorKey,
      pages: unknownStateNotifier.value == true
          ? [
              MaterialPage(
                key: const ValueKey<String>("Unknown"),
                child: UnknownScreen(),
              )
            ]
          : [_homePage],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRouterConfiguration configuration) async {
    if (configuration.unknown) {
      unknownStateNotifier.value = true;
      linkLocationNotifier.value = null;
    } else {
      unknownStateNotifier.value = false;
      linkLocationNotifier.value = configuration.linkLocation;
    }
  }
}
