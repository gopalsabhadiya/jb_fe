class AppRouterConfiguration {
  final String? linkLocation;
  final bool unknown;

  AppRouterConfiguration.link({String? link})
      : linkLocation = link,
        unknown = false;

  AppRouterConfiguration.unknown()
      : linkLocation = null,
        unknown = true;

  bool get isUnknown => unknown == true;
}
