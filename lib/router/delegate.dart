/*
 * Copyright 2020 Cagatay Ulusoy (Ulus Oy Apps). All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/router/config.dart';
import 'package:jb_fe/screens/home_screen.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';
import 'package:jb_fe/widgets/unknown_screen.dart';

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
    _homePage = const MaterialPage(
        key: ValueKey<String>("HomePage"), child: HomeScreenLayout());

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
