import 'package:flutter/material.dart';
import 'package:jb_fe/router/config.dart';
import 'package:jb_fe/util/unauthenticated_navbar.dart';

class AppRouterParser extends RouteInformationParser<AppRouterConfiguration> {
  AppRouterParser();

  @override
  Future<AppRouterConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!.toLowerCase());
    if (uri.pathSegments.length > 1) {
      return AppRouterConfiguration.unknown();
    } else if (uri.pathSegments.isEmpty) {
      return AppRouterConfiguration.link(
          link: UnauthenticatedNavbarLinks.DEFAULT_ACTIVE_LINK);
    }
    return AppRouterConfiguration.link(link: uri.pathSegments.first);
  }

  @override
  RouteInformation? restoreRouteInformation(
      AppRouterConfiguration configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/unknown');
    } else {
      return RouteInformation(
          location: configuration.linkLocation == null
              ? '/'
              : '/${configuration.linkLocation!.toLowerCase()}');
    }
  }
}
